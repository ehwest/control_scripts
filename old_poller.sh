d=`date`
pid=`ps -wC pppd |awk '  { if($1!="PID" && $1>0 ) print $1}' `
echo process number to kill is $pid
kill pid
sleep 2
rm -f /var/lock/*ttyUSB0
sleep 2
ifconfig >> /home/root/logfile.txt
/home/root/internet_start.sh
sleep 2
ifconfig >> /home/root/logfile.txt
gw=`ifconfig -a |grep P-t-P | awk '{print $3}' |sed s/P-t-P:// `
ifconfig >> /home/root/logfile.txt
echo gw=$gw
echo remote is at $PPP_REMOTE
/home/root/routeadd.sh $gw
/home/root/routeadd.sh $PPP_REMOTE
echo from /etc/actual_remote_gw
cat /etc/actual_ppp_remote_gw
gw=`cat /etc/actual_ppp_remote_gw`
/home/root/routeadd.sh $gw
rm -f mconnect.php
cp /etc/new_resolv.conf /etc/resolv.conf
#ad=69.55.75.158 is transactionalweb.com
/usr/bin/wget http://transactionalweb.com/mconnect.php
pid=`ps -wC pppd |awk '  { if($1!="PID" && $1>0 ) print $1}' `
echo process number to kill is $pid
kill $pid
sleep 2
rm -f /var/lock/*ttyUSB0
d=`date`
echo Ending script $d
