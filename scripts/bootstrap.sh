#! /bin/bash -e

ctx logger info "Bootstrapping k8s_cluster"
sudo apt install -y wget || sudo yum install -y wget

if [[ ! -f /tmp/sclib.sh ]]; then
    wget -q https://raw.githubusercontent.com/rajalokan/okanstack/master/sclib.sh -O /tmp/sclib.sh
fi
source /tmp/sclib.sh

# Preconfigure the instance
_preconfigure_instance k8s
# _preconfigure_instance master
# _preconfigure_instance node01
# _preconfigure_instance node02
#
# # Add docker repository
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
#
#
# # Add k8s repository
# curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
# deb https://apt.kubernetes.io/ kubernetes-xenial main
# EOF
#
# # Install Docker, Kubeadm, Kubelet, and Kubectl
# sudo apt-get update
# sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.12.2-00 kubeadm=1.12.2-00 kubectl=1.12.2-00
# sudo apt-mark hold docker-ce kubelet kubeadm kubectl
#
# # Enable
# echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
# sudo sysctl -p
#
# # Only on master
# sudo kubeadm init --pod-network-cidr=10.244.0.0/16
# mkdir -p $HOME/.kube
# sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
# sudo chown $(id -u):$(id -g) $HOME/.kube/config
