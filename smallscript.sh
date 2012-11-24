rm -f /tmp/onetouch_content.txt
echo "INSULAUDIT CONTENT START" > /tmp/onetouch_content.txt
date >> /tmp/onetouch_content.txt
insulaudit -v onetouch hello >> /tmp/onetouch_content.txt
date >> /tmp/onetouch_content.txt
echo "INSULAUDIT CONTENT END" >> /tmp/onetouch_content.txt

echo "textcontent=" > /tmp/onetouch_content64.txt
cat /tmp/onetouch_content.txt |base64 >> /tmp/onetouch_content64.txt

curl POST 'http://transactionalweb.com/mconnect.php' --data @/tmp/onetouch_content64.txt
