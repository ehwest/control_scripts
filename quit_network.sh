#/usr/bin/ntpdate -b -s -u pool.ntp.org
echo STARTING quit_network.sh script >> /home/root/logfile.txt
export SHELL=/bin/sh
export TERM=vt100
export USER=root
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
export PWD=/home/root
export HOME=/home/root
export SHLVL=2
exportLOGNAME=root
d=`date` 
/usr/bin/poff
#route delete default gw 66.1.125.193 dev ppp0
#route add default gw 192.168.1.1 dev eth0
echo ENDING quit_network.sh script >> /home/root/logfile.txt
d=`date` 
echo $d >>/home/root/logfile.txt
