#!/bin/sh

temp1=60
temp2=75

temp=$(sensors | grep 'CPU' | awk '{print $2}' | sed 's/+//'| sed 's/.0°C//')
temp=${temp%???}

if [ "$temp" -ge "$temp2" ] ; then
    echo "Temp: <fc=#C1514E>$temp</fc>°C"
elif [ "$temp" -ge "$temp1" ] ; then
    echo "Temp: <fc=#C1A24E>$temp</fc>°C"
else
    echo "Temp: <fc=#AAC0F0>$temp</fc>°C"
fi
