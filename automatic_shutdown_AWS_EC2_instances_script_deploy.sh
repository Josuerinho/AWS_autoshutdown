#!/bin/bash

## This is to automatically switch off the instance if there is no-process on from any of the users (and Admin isn't logged in)

count=0

user="ubuntu" # or whatever name you are using for your user

process=$(top -bn 1 | sed 1,7d | grep $user | awk '{print $2}' | uniq)
#echo $user

if [[ $process ]]
then
	((count+=1))
fi

login=$(who | awk '{print $1}' | grep $user | uniq)

if [[ $count == 0 ]] && [[ -z $login ]]; then sudo shutdown now;  fi
