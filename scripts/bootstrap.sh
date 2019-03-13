#! /bin/bash -e

ctx logger info "Bootstrapping k8s_cluster"
sudo apt install -y wget || sudo yum install -y wget

if [[ ! -f /tmp/sclib.sh ]]; then
    wget -q https://raw.githubusercontent.com/rajalokan/okanstack/master/sclib.sh -O /tmp/sclib.sh
fi
source /tmp/sclib.sh

# Preconfigure the instance
_preconfigure_instance k8s
