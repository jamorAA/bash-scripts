#!/bin/bash

apt update
apt install openjdk-25-jre-headless

echo
java --version

if [ "$?" == 0 ]
then
	echo "Java installed successfully"
else
	echo "Java installation has failed"
fi
