#!/bin/bash
sudo apt-get update && sudo apt-get install -y sshpass;
sudo apt-get install -y ansible;
cat << EOF > /etc/ansible/.ansible.cfg
[default]
host_key_checking = False
EOF
