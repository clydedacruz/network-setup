#!/bin/bash


killall -w java

cd /opt/chainops_api/chainops-api
git pull
nohup ./gradlew runDashboardApi > dashboard.log 2>&1 &
cd -

echo "restarted dashboard API !!!"
