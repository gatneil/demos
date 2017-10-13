set -evx

sudo -i # become root because running through ssh, not extension

echo "WEBSERVER OUTPUT"
echo "================"
cat /var/lib/waagent/custom-script/download/0/stderr.webserver.txt
