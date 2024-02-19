#!/bin/bash

msfdb init

msfconsole -n -x "set LHOST $LHOST" -r /home/gvc/set-msf-env.rc