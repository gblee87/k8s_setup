#!/bin/bash
sudo apt-get update && sudo apt-get install -y sshpass;
sudo apt-get install -y ansible;
sudo cat>/etc/ansible/.ansible.cfg<<EOF
[defaults]
host_key_checking = False
EOF
