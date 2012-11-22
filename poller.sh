#/usr/bin/ntpdate -b -s -u pool.ntp.org

date >> /home/root/logfile.txt
echo "Starting poller.sh script." >> /home/root/logfile.txt
export SHELL=/bin/sh
export TERM=vt100
export USER=root
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PWD=/home/root
export HOME=/home/root
export SHLVL=2
exportLOGNAME=root

date >> /home/root/logfile.txt
echo "Starting usb_discover.sh"  >> /home/root/logfile.txt

/home/root/usb_discover.sh >> /tmp/onetouch_content.txt
export tty_bcm=/dev/`cat /etc/tty_bcm`
export tty_sierra=/dev/`cat /etc/tty_sierra`
echo tty_bcm=$tty_bcm  >> /tmp/onetouch_content.txt
echo tty_sierra=$tty_sierra  >> /tmp/onetouch_content.txt


date >> /home/root/logfile.txt
echo "Starting insulaudit python script."  >> /home/root/logfile.txt

epochtime=`date +%s`
filename1=model_read-${epochtime}
/usr/bin/insulaudit onetouch --port ${tty_bcm} hello  >> /tmp/${filename1}
cat /tmp/${filename1} >> /tmp/onetouch_content.txt

filename2=data_read-${epochtime}
/usr/bin/insulaudit onetouch --port ${tty_bcm} sugars  >> /tmp/${filename2}
cat /tmp/${filename2} >> /tmp/onetouch_content.txt

message1=`/bin/base64 --wrap=0 /tmp/${filename1}`
message2=`/bin/base64 --wrap=0 /tmp/${filename2}`

echo $message1  >> /tmp/onetouch_content.txt
echo $message2   >> /tmp/onetouch_content.txt


date >> /home/root/logfile.txt
echo "Joining the network with join_network.sh script."  >> /home/root/logfile.txt

/home/root/join_network.sh   >> /home/root/logfile.txt

date >> /home/root/logfile.txt
echo "Getting current time/date from NTP server."  >> /home/root/logfile.txt

/usr/bin/ntpdate -b -s -u pool.ntp.org
date >> /home/root/logfile.txt



date >> /home/root/logfile.txt
echo "Starting curl to post the data."  >> /home/root/logfile.txt

# send PUT request with data
curl --request POST 'http://transactionalweb.com/mconnect.php' --data-urlencode 'postedcontent='${message1}
curl --request POST 'http://transactionalweb.com/mconnect.php' --data-urlencode 'postedcontent='${message2}

date >> /home/root/logfile.txt
echo "Starting quit_network.sh script. "  >> /home/root/logfile.txt

/home/root/quit_network.sh

date >> /home/root/logfile.txt
echo "Done running poller.sh script. "  >> /home/root/logfile.txt
