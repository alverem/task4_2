#!/bin/bash

#check ntp service process
check=`/bin/ps aux | pgrep ntp | wc -l`

#if ntp service isn't launched, start it
if [ "$check -eq 0" ]
then {
/etc/init.d/ntp start
}
else 
exit 0
fi

# check defferience between /etc/ntp.conf and /etc/ntp.back
# if files doesn't match restore /etc/ntp.back from backup 

q=`diff /etc/ntp.conf /etc/ntp.back`

if [ $q ]

then
 exit 0
else 
{
echo $q
cat /etc/ntp.back>/etc/ntp.conf
}
fi


