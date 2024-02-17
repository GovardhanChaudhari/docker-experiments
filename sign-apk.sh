#!/bin/bash

cd /data

# Generate keystore
#keytool -genkey -V -keystore key.keystore -alias hacked -keyalg RSA -keysize 2048 -validity 10000
keytool -genkeypair -alias gmskey -keyalg RSA -keysize 2048 -keystore key.keystore -validity 10000

# Sign APK
#jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore key.keystore gms.apk hacked
jarsigner -keystore key.keystore -storepass gvc123 -keypass gvc123 gms.apk gmskey

# Verify signature
#jarsigner -verify -verbose -certs gms.apk
jarsigner -verify -keystore key.keystore gms.apk