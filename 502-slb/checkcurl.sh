set -evx

sudo -i

echo "CURL SERVER STDOUT"
echo "=================="

cat /var/lib/waagent/custom-script/download/0/stdout

echo ""
echo ""

echo "CURL SERVER STDERR"
echo "=================="

cat /var/lib/waagent/custom-script/download/0/stderr

echo "CURL SERVER *"
echo "============="
cat /var/lib/waagent/custom-script/download/0/*
