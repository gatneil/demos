PIP=$(cat /pip.txt) # get the PIP to curl

while true
do
    curl ${PIP}/stopping
    sleep 5
done
