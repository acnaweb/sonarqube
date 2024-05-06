#!/bin/bash

export SONAR_FILE=sonarqube-10.5.1.90531.zip
export SONAR_FOLDER=sonarqube-10.5.1.90531
useradd sonarqube
apt install -y wget openjdk-11-jdk unzip
wget https://binaries.sonarsource.com/Distribution/sonarqube/$SONAR_FILE
unzip -o $SONAR_FILE -d /opt
mv /opt/$SONAR_FOLDER /opt/sonarqube
chown -R sonarqube:sonarqube /opt/sonarqube


touch /etc/systemd/system/sonar.service
echo > /etc/systemd/system/sonar.service
cat <<EOT > /etc/systemd/system/sonar.service
[Unit]
Description=SonarQube service
After=syslog.target network.target
[Service]
ExecStart=/opt/sonarqube/bin/linux-x86-64/sonar.sh start
ExecStop=/opt/sonarqube/bin/linux-x86-64/sonar.sh stop
User=sonarqube
Group=sonarqube
Restart=always
StandardOutput=journal
[Install]
WantedBy=multi-user.target
EOT