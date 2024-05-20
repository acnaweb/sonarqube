#!/bin/bash

apt update

sh /vagrant/scripts/install_java_17.sh
sh /vagrant/scripts/install_docker.sh
sudo usermod -aG docker vagrant

sh /vagrant/scripts/run_container.sh
# sh /vagrant/scripts/install_sonarqube.sh

