set -evx

URLBASE=$1

# partition, format, and mount the data disk; don't bother with fstab for this demo
echo "n
p
1


w"| fdisk /dev/sdc

mkfs -t ext4 /dev/sdc1
mkdir /data
mount -t ext4 /dev/sdc1 /data

touch /data/onstartoutput.txt
touch /data/onstopoutput.txt

curl ${URLBASE}/onstartstop.service > /etc/systemd/system/onstartstop.service
curl ${URLBASE}/onstart.sh > /data/onstart.sh
curl ${URLBASE}/onstop.sh > /data/onstop.sh

chmod 755 /etc/systemd/system/onstartstop.service
chmod 755 /data/onstart.sh
chmod 755 /data/onstop.sh

#systemctl enable onstartstop --now
systemctl enable onstartstop
reboot
