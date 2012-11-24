
# /etc/init.d/pppd
#pppd call provider

pon

#PORT=ttyUSB0
#/usr/sbin/pppd $PORT 115200 debug dump logfile logfile.txt crtscts updetach defaultroute usepeerdns lcp-echo-failure 6 lcp-echo-interval 10 connect '/usr/sbin/chat -t 6 -s -v "" +++ATH OK ATD*99 CONNECT \n\d '  

#/usr/sbin/pppd $PORT debug dump logfile logfile.txt 115200 kdebug 1 crtscts updetach defaultroute usepeerdns lcp-echo-failure 6 lcp-echo-interval 10 connect '/usr/sbin/chat -t 6 - s -v "" ATZ OK ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 ISDN = 0'  
