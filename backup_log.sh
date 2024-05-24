#!/bin/bash

cd ~/Springboot-JPA-Blog

TIME=$(date +'%Y-%m-%d-%H-%M-%S')
LOGFILE="nohup-$TIME.out"

cp target/nohup.out "target/$LOGFILE"
echo "Log file renamed to $LOGFILE from nohup.out" | tee -a "target/$LOGFILE"

cat /dev/null > target/nohup.out
echo "Log file was backed up at $TIME from nohup.out" | tee -a target/nohup
