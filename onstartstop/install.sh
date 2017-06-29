# partition, format, and mount the data disk; don't bother with fstab for this demo
echo "n
p
1


w"| fdisk /dev/sdc

mkfs -t ext4 /dev/sdc1
mount -t ext4 /dev/sdc1 /data

touch /data/onstartoutput.txt
touch /data/onstopoutput.txt

