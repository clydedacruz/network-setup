#!/bin/bash

set -e


ssh root@p1 << EOF
export JAVA_HOME=/opt/java
export DOCKER_COMPOSE_FILE_NAME=docker-compose
export MCDS_RESOURCES=/opt/chainops_api/chainops-api/hf-sdk-wrapper/src/test/fixture
export ORG_PATH=/root/fabric-setup/org1
killall -w java
cd /opt/chainops_api/chainops-api

git pull
nohup ./gradlew runOrgApi > org-api.log 2>&1 &
cd -
EOF


echo "restarted org API !!!"
