#!/usr/bin/env bash

echo 'Start ShellScript'
# タイムゾーンを日本に変更
sudo cp -p /usr/share/zoneinfo/Japan /etc/localtime

if ! [ `which ansible` ]; then
    sudo yum update -y
    sudo yum install -y ansible
    cp /vagrant/servers /home/vagrant/
    chmod 644 /home/vagrant/servers
fi
cp /vagrant/ansible.yml /vagrant/ansible/ansible.yml
ansible-playbook -i /home/vagrant/servers /vagrant/ansible/ansible.yml
