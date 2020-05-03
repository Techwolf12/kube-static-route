#!/bin/sh
echo "Route from INETROUTE env: $INETROUTE"
CURRENTROUTE=`nsenter -t 1 -m -u -n -i -- sh -c 'ip route show default' | awk -F ' ' '/default/ {print $3}'`
echo "Current route: $CURRENTROUTE"


if [ "$CURRENTROUTE" = "$INETROUTE" ]
then
  echo "Current and INETROUTE are the same, doing nothing"
else
  echo "Changing route from $CURRENTROUTE to $INETROUTE"
  nsenter -t 1 -m -u -n -i -- sh -c "ip route change default via $INETROUTE"
fi

echo -e "\n---\n"
