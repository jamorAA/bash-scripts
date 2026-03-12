#!/bin/bash

curl -u dev:dev -X GET 'http://158.160.209.188:8081/service/rest/v1/components?repository=npm-snapshots&sort=version' | jq "." > artifact.json
artifactDownloadUrl=$(jq '.items[].assets[].downloadUrl' artifact.json --raw-output)

filename=nodejsapp.tgz
wget -O $filename --http-user=dev --http-password=dev $artifactDownloadUrl

tar -zxvf $filename
cd package
npm install
node server.js &
