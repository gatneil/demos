set -evx

URLBASE=$1
PIP=$2

echo ${PIP} > /pip.txt # save the PIP to curl on stop

curl ${URLBASE}/onstartstop.service > /etc/systemd/system/onstartstop.service
curl ${URLBASE}/onstart.sh > /onstart.sh
curl ${URLBASE}/onstop.sh > /onstop.sh

chmod 755 /etc/systemd/system/onstartstop.service
chmod 755 /onstart.sh
chmod 755 /onstop.sh

systemctl enable onstartstop --now
