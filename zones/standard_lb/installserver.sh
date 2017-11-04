#!/bin/bash

set -evx

apt-get update
apt-get install python-pip -y
pip install --upgrade pip
pip install flask

curl -o server.py https://raw.githubusercontent.com/gatneil/demos/master/zones/standard_lb/server.py

export FLASK_APP=server.py

python -m flask run --host=0.0.0.0 &
