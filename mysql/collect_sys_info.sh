#!/bin/sh

xsql="mysql -u root -pnaruto"

INTERVAL=5
PREFIX=$INTERVAL-sec-status
RUNFILE=/tmp/running
$xsql -e 'SHOW GLOBAL VARIABLES' >> mysql-variables 2>/dev/null
while test -e $RUNFILE; do
    file=$(date +%F_%I)
    sleep=$(date +%s.%N | awk "{print $INTERVAL - (\$1 % $INTERVAL)}")
    sleep $sleep
    ts="$(date +"TS %s.%N %F %T")"
    echo $ts
    loadavg="$(uptime)"
    echo "$ts $loadavg" >> $PREFIX-${file}-status
    $xsql -e 'SHOW GLOBAL STATUS' >> $PREFIX-${file}-status 2>/dev/null&
    echo "$ts $loadavg" >> $PREFIX-${file}-innodbstatus
    $xsql -e 'SHOW ENGINE INNODB STATUS\G' >> $PREFIX-${file}-innodbstatus 2>/dev/null&
    echo "$ts $loadavg" >> $PREFIX-${file}-processlist
    $xsql -e 'SHOW FULL PROCESSLIST\G' >> $PREFIX-${file}-processlist 2>/dev/null&
done
echo "Existing because $RUNFILE does not exist"
