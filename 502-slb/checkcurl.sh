set -evx

sudo -i

echo "CURL SERVER STDOUT"
echo "=================="

cat /var/lib/waagent/custom-script/downloads/0/stdout

echo ""
echo ""

echo "CURL SERVER STDERR"
echo "=================="

cat /var/lib/waagent/custom-script/downloads/0/stderr
