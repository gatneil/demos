import time
import azurerm
import pprint
import datetime
import sys
import json
import argparse
sys.path.insert(0, '/home/negat/credentials/aad/')

from aadcredentials import *

pp = pprint.PrettyPrinter(indent=2)

access_token = azurerm.get_access_token(
    tenant_id,
    application_id,
    application_secret
)

parser = argparse.ArgumentParser(description='Swap a PIP from one LB to another.')
parser.add_argument('--src_lb_rg', type=str, required=True,
                    help='The resource group name of the LB with the PIP to transfer.')
parser.add_argument('--src_lb_name', type=str, required=True,
                    help='The name of the LB with the PIP to transfer.')
parser.add_argument('--dest_lb_rg', type=str, required=True,
                    help='The resource group name of the LB to transfer the PIP to.')
parser.add_argument('--dest_lb_name', type=str, required=True,
                    help='The name of the LB to transfer the PIP to.')

args = parser.parse_args()

def wait_for_operation_success(operation_url):
    while True:
        time.sleep(5)
        operation_status_req = azurerm.do_get(operation_url, access_token)
        operation_status = operation_status_req["status"]
        print(operation_status)
        if operation_status == "Succeeded":
            return


def swap_lb(src_lb_rg, src_lb_name, dest_lb_rg, dest_lb_name):
    src_lb_url = "https://management.azure.com/subscriptions/" + subscription_id + "/resourceGroups/" + src_lb_rg + "/providers/Microsoft.Network/loadBalancers/" + src_lb_name + "?api-version=2017-06-01"
    dest_lb_url = "https://management.azure.com/subscriptions/" + subscription_id + "/resourceGroups/" + dest_lb_rg + "/providers/Microsoft.Network/loadBalancers/" + dest_lb_name + "?api-version=2017-06-01"
    src_lb_config = azurerm.do_get(src_lb_url, access_token)
    dest_lb_config = azurerm.do_get(dest_lb_url, access_token)

    # transfer properties from src to dest configs
    dest_lb_config["properties"]["frontendIPConfigurations"][0]["properties"]["publicIPAddress"]["id"] = src_lb_config["properties"]["frontendIPConfigurations"][0]["properties"]["publicIPAddress"]["id"]
    src_lb_config["properties"]["frontendIPConfigurations"][0]["properties"]["publicIPAddress"] = {}

    print("PUT " + src_lb_url)
    pp.pprint(src_lb_config)
    res = azurerm.do_put(src_lb_url, json.dumps(src_lb_config), access_token)
    print(res)
    print(res.headers)
    print(res.text)

    operation_url = res.headers["Azure-AsyncOperation"]
    wait_for_operation_success(operation_url)


    print("PUT " + dest_lb_url)
    pp.pprint(dest_lb_config)
    res = azurerm.do_put(dest_lb_url, json.dumps(dest_lb_config), access_token)
    print(res)
    print(res.headers)
    print(res.text)

    operation_url = res.headers["Azure-AsyncOperation"]
    wait_for_operation_success(operation_url)

start_time = time.time()
swap_lb(args.src_lb_rg, args.src_lb_name, args.dest_lb_rg, args.dest_lb_name)
end_time = time.time()
duration = end_time - start_time
print("Swapping of PIP took " + duration + " seconds to complete")
