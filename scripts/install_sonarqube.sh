#!/bin/bash

source /vagrant/scripts/bootstrap.sh

export SONAR_FILE=sonarqube-10.5.1.90531.zip
export SONAR_FOLDER=/opt/sonarqube-10.5.1.90531
export SONARQUBE_HOME=/opt/sonarqube
export SONAR_JAVA_PATH=/usr/bin/java

sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
# ulimit -n 131072
# ulimit -u 8192

useradd sonarqube
apt install -y wget unzip
wget https://binaries.sonarsource.com/Distribution/sonarqube/$SONAR_FILE
unzip -o $SONAR_FILE -d /opt
mv $SONAR_FOLDER $SONARQUBE_HOME
chown -R sonarqube:sonarqube $SONARQUBE_HOME

cp /vagrant/scripts/sonarqube.service /etc/systemd/system/sonarqube.service
sudo systemctl enable sonarqube.service
sudo systemctl start sonarqube.service
