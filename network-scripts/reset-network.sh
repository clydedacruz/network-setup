#!/bin/bash

# set -e

ssh root@orderer 'cd /root/fabric-setup/orderer && docker-compose -f docker-compose_orderer0.persistent.com.yaml down --remove-orphans'

ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose -f docker-compose-ca.yaml down --remove-orphans'

ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose -f docker-compose_peer0.acme.com.yaml down --remove-orphans'
ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose -f docker-compose_peer1.acme.com.yaml down --remove-orphans'

ssh root@p2 'cd /root/fabric-setup/org2 && docker-compose -f docker-compose_peer0.ancbank.com.yaml down --remove-orphans'
ssh root@p2 'cd /root/fabric-setup/org2 && docker-compose -f docker-compose_peer1.ancbank.com.yaml down --remove-orphans'



ssh root@orderer 'cd /root/fabric-setup/orderer && docker-compose -f docker-compose_orderer0.persistent.com.yaml up -d'

ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose -f docker-compose-ca.yaml up -d'

ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose -f docker-compose_peer0.acme.com.yaml up -d'
ssh root@p1 'cd /root/fabric-setup/org1 && docker-compose -f docker-compose_peer1.acme.com.yaml up -d'

ssh root@p2 'cd /root/fabric-setup/org2 && docker-compose -f docker-compose_peer0.ancbank.com.yaml up -d'
ssh root@p2 'cd /root/fabric-setup/org2 && docker-compose -f docker-compose_peer1.ancbank.com.yaml up -d'


echo "restarted network !!!"