#!/bin/bash

set -evx

export DEBIAN_FRONTEND=noninteractive

# install flask
apt-get update
apt-get upgrade -y
apt-get install python-pip -y
pip install flask

uriBase="https://raw.githubusercontent.com/gatneil/scripts/master/"

if [ $1 ]
then
    uriBase=$1
fi

# download and run the app that will count requests
wget ${uriBase}count_requests.py
FLASK_APP=count_requests.py flask run --host=0.0.0.0 &

