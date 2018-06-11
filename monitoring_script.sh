
#!/bin/bash
SERVICE=consul_backup
# description: This shell script validates of running consul_backup service

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
#    echo "$SERVICE service running, everything is fine"
echo "1"
else
#    echo "$SERVICE is not running"
echo "0"
fi
