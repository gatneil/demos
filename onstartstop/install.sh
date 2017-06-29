URLBASE=$1

# partition, format, and mount the data disk; don't bother with fstab for this demo
echo "n
p
1


w"| fdisk /dev/sdc

mkfs -t ext4 /dev/sdc1
mount -t ext4 /dev/sdc1 /data

touch /data/onstartoutput.txt
touch /data/onstopoutput.txt

curl ${URLBASE}/onstart.sh > /data/onstart.sh
curl ${URLBASE}/onstop.sh > /data/onstop.sh

# temporary test
bash onstart.sh
bash onstop.sh
