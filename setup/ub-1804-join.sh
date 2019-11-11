#!/bin/bash

# copy the config & write it out
mkdir -p $HOME/.kube
cp -i /vagrant/share/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
join=$(cat /vagrant/share/join-command)
sudo $join

clear
cat $HOME/.kube/config