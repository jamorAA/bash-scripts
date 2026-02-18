#!/bin/bash

sudo apt update
sudo apt install -y nodejs
sudo apt install -y npm

echo
echo "node version is $(node --version)"
echo
echo "npm version is $(npm --version)"
echo

sudo useradd -m -s /bin/bash -p $(openssl passwd -1 "myapp") myapp

sudo runuser -l myapp -c "wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz;
                     tar -zxvf bootcamp-node-envvars-project-1.0.0.tgz;
		     export APP_ENV=dev;
                     export DB_USER=myuser;
                     export DB_PWD=mysecret;
		     mkdir -p "$1";
		     if [ -d "$1" ];
		       then
		         export LOG_DIR="$1";
                     fi;
		     cd package;
		     npm install;
		     node server.js &"

echo
echo "PID for the node app is $(ps aux | grep "node server.js" | grep -v grep | awk '{print $2}')"
echo

sudo netstat -tlpn | grep :3000
