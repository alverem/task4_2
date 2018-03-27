#!/bin/bash
apt install -y ntp
/etc/init.d/ntp stop

#change default ntp servers in ntp.conf to ua.pool.ntp.org and backup config file
sed -r 's/ubuntu.pool.ntp.org/ua.pool.ntp.org/g' /etc/ntp.conf > /etc/ntp.back

#rewrite new config
cat /etc/ntp.back > /etc/ntp.conf

#add new task to schelouder
a=`pwd`
echo "*/5 * * * * root $a/ntp_verify.sh">>/etc/crontab

#start ntp service
/etc/init.d/ntp start

