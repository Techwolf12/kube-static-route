#!/bin/sh
CURRENTROUTE=`nsenter -t 1 -m -u -n -i -- sh -c 'ip route show default' | awk -F ' ' '/default/ {print $3}'`
if [ "$SILENT" != "true"]
then
  echo "Route from INETROUTE env: $INETROUTE"
  echo "Current route: $CURRENTROUTE"
fi

if [ "$CURRENTROUTE" = "$INETROUTE" ]
then
  if [ "$SILENT" != "true"]
  then
    echo "Current and INETROUTE are the same, doing nothing"
  fi
else
  echo "Changing route from $CURRENTROUTE to $INETROUTE"
  nsenter -t 1 -m -u -n -i -- sh -c "ip route change default via $INETROUTE"
fi

if [ "$SILENT" != "true"]
then
  echo -e "\n---\n"
fi
