#!/bin/bash
apt-get update && sudo apt-get install -y sshpass;
apt-get install -y ansible;
cat>/etc/ansible/.ansible.cfg<<EOF
[defaults]
host_key_checking = False
EOF
