#!/bin/sh

DEVICE_IP=192.168.1.116
echo "adb connect $DEVICE_IP"
adb connect "$DEVICE_IP"
