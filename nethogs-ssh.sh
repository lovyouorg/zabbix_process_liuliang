#!/bin/bash
USER="root"
DATABASE="nethogs"
TABLE="sshd"
PASSWORD="12345"
DATE=`date '+%Y%m%d%H%M%S'`
function insert()
{
while true
do
send=`/usr/sbin/nethogs  -c4 -t|grep sshd|awk 'END{print $3}'`
receive=`/usr/sbin/nethogs  -c4 -t|grep sshd|awk 'END{print $4}'`
echo $send,$receive
	mysql -u$USER -p$PASSWORD $DATABASE -e "INSERT INTO $TABLE VALUES(now(),'${send}','${receive}')"
	sleep 4
done
}
insert;
