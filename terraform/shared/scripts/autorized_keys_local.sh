#!/bin/bash

mkdir -p /home/ec2-user/.ssh

cat <<FILE > /home/ec2-user/.ssh/authorized_keys
  SSH KEY HERE
FILE

chown ec2-user.ec2-user /home/ec2-user/.ssh/authorized_keys
chmod 400 /home/ec2-user/.ssh/authorized_keys