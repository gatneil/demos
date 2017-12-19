#!/bin/bash

curl ${1}:5000/checkin/$(hostname)
