#!/bin/bash

set -evx

apt-get update
#apt-get upgrade -y
apt-get install python-pip -y
pip install --upgrade pip
pip install flask

curl -o ml_server.py https://raw.githubusercontent.com/gatneil/demos/ignite2017/ignite2017/ml_server.py

export FLASK_APP=ml_server.py

python -m flask run --host=0.0.0.0 &
