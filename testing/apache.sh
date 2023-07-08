#!/bin/bash
sudo apt update -y
sudo apt install -y ca-certificates curl openssh-server postfix tzdata perl
curl -LO https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh
sudo bash script.deb.sh
sudo apt install gitlab-ce

# sudo apt-get update -y
# sudo apt install ca-certificates curl openssh-server postfix tzdata perl
# sudo apt-get install -y curl openssh-server ca-certificates tzdata perl
# curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh 
# sudo bash script.deb.sh
# sudo EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee

# sudo systemctl start sshd
# sudo systemctl enable sshd
