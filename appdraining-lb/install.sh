set -evx

URLBASE=$1

# partition, format, and mount the data disk
echo "n
p
1


w"| fdisk /dev/sdc

mkfs -t ext4 /dev/sdc1
mkdir /data
mount -t ext4 /dev/sdc1 /data

# add to fstab as well so the disk gets attached on reboot
echo "/dev/sdc1       /data   ext4    defaults        0       2" >> /etc/fstab

touch /data/onstartoutput.txt
touch /data/onstopoutput.txt

curl ${URLBASE}/onstartstop.service > /etc/systemd/system/onstartstop.service
curl ${URLBASE}/onstart.sh > /data/onstart.sh
curl ${URLBASE}/onstop.sh > /data/onstop.sh

chmod 755 /etc/systemd/system/onstartstop.service
chmod 755 /data/onstart.sh
chmod 755 /data/onstop.sh

systemctl enable onstartstop --now

export DEBIAN_FRONTEND=noninteractive

# install flask
apt-get update
apt-get upgrade -y
apt-get install python-pip -y
pip install flask

# download and run the app that will log requests
wget ${URLBASE}/webserver.py
FLASK_APP=webserver.py flask run --host=0.0.0.0 >stdout.webserver.txt 2>stderr.webserver.txt & 
