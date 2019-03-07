#!/bin/bash

set -e


ssh root@p1 << EOF
export JAVA_HOME=/opt/java
export DOCKER_COMPOSE_FILE_NAME=/root/fabric-setup/org1/docker-compose
export MCDS_RESOURCES=/root/org-api/chainops_api/chainops-api/hf-sdk-wrapper/src/test/fixture

killall -w java
cd /opt/chainops_api/chainops-api
nohup ./gradlew runOrgApi > org-api.log 2>&1 &
cd -
EOF


echo "restarted org API !!!"
