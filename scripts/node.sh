#!/bin/bash

###############################################################
#                                                             # 
# node.sh - Script for node configuration	                  #         
#                                                             #
# Author: Vinicius Fialho - (vinytisolution@gmail.com)         #
# Date created: 2023/01/25                                    # 
#                                                             #
# Description: This script configure node for k8s    	      #
#                                                             #
###############################################################                                                                  

set -euxo pipefail

/bin/bash /vagrant/configs/join.sh -v

sudo -i -u vagrant bash << EOF
whoami
mkdir -p /home/vagrant/.kube
sudo cp -i /vagrant/configs/config /home/vagrant/.kube/
sudo chown 1000:1000 /home/vagrant/.kube/config
NODENAME=$(hostname -s)
kubectl label node $(hostname -s) node-role.kubernetes.io/worker=worker
EOF
