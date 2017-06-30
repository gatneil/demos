#!/bin/bash

set -evx

URLBASE=$1

export DEBIAN_FRONTEND=noninteractive

# install flask
apt-get update
apt-get upgrade -y
apt-get install python-pip -y
pip install flask

# download and run the app that will log requests
wget ${URLBASE}/webserver.py
FLASK_APP=webserver.py flask run --host=0.0.0.0 >stdout.webserver.txt 2>stderr.webserver.txt & 
