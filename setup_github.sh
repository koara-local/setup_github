#!/bin/bash -e

if [ ! -e ~/.ssh/id_rsa_github ]; then
    read -sp "Enter passphrase (minimum five characters) [empty for no passphrase]:" PASSPHRASE
    echo ""
    ssh-keygen -t rsa -b 2048 -N "${PASSPHRASE}" -f ~/.ssh/id_rsa_github
else
    echo "\"~/.ssh/id_rsa_github\" already exists."
    echo "If you want to overwrite those files, delete them manually."
    echo "\"rm ~/.ssh/id_rsa_github ~/.ssh/id_rsa_github.pub\""
    echo ""
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

echo "please, Adding a new SSH key to your GitHub account."
echo "https://github.com/settings/ssh"
echo ""

cat ~/.ssh/id_rsa_github.pub
