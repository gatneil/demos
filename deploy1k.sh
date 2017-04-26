set -evx

commit=`git log | head -1 | cut -d ' ' -f 2`
ssh negat@nginx "rm -rf $commit && mkdir $commit"
scp install_count_requests.sh count_requests.py checkin.sh negat@nginx:~/$commit
ssh negat@nginx "sudo cp -R $commit /var/www/html/"
./vmss1kextension.sh ${FILE_URL_BASE}/${commit}/



