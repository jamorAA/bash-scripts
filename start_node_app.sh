#!/bin/bash

sudo apt update
sudo apt install -y nodejs
sudo apt install -y npm

echo
node --version
echo
npm --version
echo

wget https://node-envvars-artifact.s3.eu-west-2.amazonaws.com/bootcamp-node-envvars-project-1.0.0.tgz
tar -zxvf bootcamp-node-envvars-project-1.0.0.tgz

export APP_ENV=dev
export DB_USER=myuser
export DB_PWD=mysecret

cd package
npm install
node server.js &
