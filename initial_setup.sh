#!/bin/bash
echo "########## install ansible and sshpass and configure ssh host key check to False##########"
sudo apt-get update && sudo apt-get install -y sshpass;
sudo apt-get install -y ansible;
sudo cat>~/.ansible.cfg<<EOF
[defaults]
host_key_checking = False
EOF

echo "########## update worker and master by ansible ###########"
cd ./ansible
ansible-playbook -i hosts playbook.yml

echo "########## install kubeadm ##########"
sudo kubeadm init --apiserver-advertise-address 192.168.77.10

echo "########## make current user as k8s user"
echo `hostname` > sudo /etc/hostname
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u)$(id -g) $HOME/.kube/config
