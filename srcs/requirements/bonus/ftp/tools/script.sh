#!/bin/sh

service vsftpd start

adduser $FTP_USER --disabled-password

echo "$FTP_USER:$FTP_PWD" | /usr/sbin/chpasswd

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist 

chown $FTP_USER:$FTP_USER /var/www/html

sed -i -r "s/#write_enable=YES/write_enable=YES/1"   /etc/vsftpd.conf
sed -i -r "s/#chroot_local_user=YES/chroot_local_user=YES/1"   /etc/vsftpd.conf

service vsftpd stop

/usr/sbin/vsftpd
