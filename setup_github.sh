#!/bin/bash -eu

if [ ! -e ~/.ssh/id_rsa_github ]; then
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa_github
fi

if [ ! -e ~/.ssh/config ] || [ $(cat ~/.ssh/config | grep github | wc -l) == 0 ]; then
cat << EOS >> ~/.ssh/config
Host github github.com
User git
Hostname github.com
Port 22
IdentityFile ~/.ssh/id_rsa_github
EOS
fi

echo -e "please, Adding a new SSH key to your GitHub account\n"

cat ~/.ssh/id_rsa_github.pub
