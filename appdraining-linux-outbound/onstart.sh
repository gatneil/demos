PIP=$(cat /pip.txt) # get the PIP to curl

while true
do
    curl ${PIP}/starting
    sleep 5
done
