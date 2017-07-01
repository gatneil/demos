set -evx

sudo -i # become root because running through ssh, not extension

echo "WEBSERVER OUTPUT"
echo "================"
cat /stderr.webserver.txt
