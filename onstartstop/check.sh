set -evx

sudo -i # become root because running through ssh, not extension

mkdir /data
mount -t ext4 /dev/sdc1 /data

echo "ON START OUTPUT"
echo "==============="
cat /data/onstartoutput.txt

echo ""
echo ""

echo "ON STOP OUTPUT"
echo "=============="
cat /data/onstopoutput.txt
