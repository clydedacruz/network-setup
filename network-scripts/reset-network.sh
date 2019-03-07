#!/bin/bash

set -e

ssh root@orderer 'cd /root/fabric-setup/orderer && docker-compose down'
ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose down'
ssh root@p2 'cd /root/fabric-setup/org2 && docker-compose down'


ssh root@orderer 'cd /root/fabric-setup/orderer && docker-compose up -d'
ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose up -d'
ssh root@p2 'cd /root/fabric-setup/org2 && docker-compose up -d'


echo "restarted network !!!"