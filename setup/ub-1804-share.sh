#!/bin/bash

mkdir -p /vagrant/share
sudo cp /etc/kubernetes/admin.conf /vagrant/share
kubeadm token create --print-join-command > /vagrant/share/join-command
