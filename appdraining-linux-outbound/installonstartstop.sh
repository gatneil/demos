set -evx

URLBASE=$1

echo ${URLBASE} > /pip.txt # save the PIP to curl on stop

curl ${URLBASE}/onstartstop.service > /etc/systemd/system/onstartstop.service
curl ${URLBASE}/onstart.sh > /data/onstart.sh
curl ${URLBASE}/onstop.sh > /data/onstop.sh

chmod 755 /etc/systemd/system/onstartstop.service
chmod 755 /data/onstart.sh
chmod 755 /data/onstop.sh

systemctl enable onstartstop --now
