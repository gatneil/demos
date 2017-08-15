PIP=$1

while true
do
    curl ${PIP} -D $(date | tr -d ' ').txt
done
