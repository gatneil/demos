#!/bin/bash

set -evx

export DEBIAN_FRONTEND=noninteractive

# install flask
apt-get update
apt-get upgrade -y
apt-get install python-pip -y
pip install flask

# download and run the app that will count requests
wget ${1}/listener.py
FLASK_APP=listener.py flask run --host=0.0.0.0 &

