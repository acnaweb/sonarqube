#!/bin/bash

echo "Running container"

sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
# ulimit -n 131072
# ulimit -u 8192

# https://docs.sonarsource.com/sonarqube/latest/setup-and-upgrade/install-the-server/installing-sonarqube-from-docker/

# docker volume create --name sonarqube_data
# docker volume create --name sonarqube_logs
# docker volume create --name sonarqube_extensions

# docker run -d --name sonarqube \
#     -p 9000:9000 \
#     -v sonarqube_data:/opt/sonarqube/data \
#     -v sonarqube_extensions:/opt/sonarqube/extensions \
#     -v sonarqube_logs:/opt/sonarqube/logs \
#     sonarqube:lts-community

docker compose -f /vagrant/scripts/compose.yaml up -d
