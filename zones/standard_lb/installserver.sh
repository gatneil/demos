#!/bin/bash

set -evx

apt-get update
apt-get install python-pip -y
pip install --upgrade pip
pip install flask

curl -o server.py ${1}/server.py

export FLASK_APP=server.py

python -m flask run --host=0.0.0.0 &
