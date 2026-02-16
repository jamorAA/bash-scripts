#!/bin/bash

apt update
apt install -y default-jre

echo
java --version

if [ "$?" == 0 ]
then
	echo "Java installed successfully"
else
	echo "Java installation has failed"
fi
