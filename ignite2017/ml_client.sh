#!/bin/bash

set -evx

curl https://raw.githubusercontent.com/gatneil/demos/ignite2017/ignite2017/emerson.txt -o emerson.txt

while true;
do
    while read -r line;
    do
	curl ${1}/summarize -F text="$line"
    done < emerson.txt
done
