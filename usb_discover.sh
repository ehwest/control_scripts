echo Discovering USB port assignments

export tty_bcm=`/bin/dmesg | grep "pl2303 converter now attached to" | awk ' {tty=$NF}  END { print tty}'`

export tty_sierra=`/bin/dmesg | grep "USB modem converter now attached" | awk ' { tty1=tty2;tty2=tty3;tty3=tty4;tty4=$NF }  END { print tty1}'`

echo tty_bcm = $tty_bcm
echo tty_sierra = $tty_sierra

echo $tty_bcm > /etc/tty_bcm
echo $tty_sierra > /etc/tty_sierra
