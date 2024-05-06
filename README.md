# SonarQube

Clean code for teams and enterprises

## Install

## Commands

### Docker

#### Server

- https://docs.sonarsource.com/sonarqube/latest/try-out-sonarqube/

```sh
docker run -d --name sonarqube \
        -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true \
        -p 9000:9000 \
        sonarqube:latest
```
> - login: admin
> - password: admin

#### SonarScanner CLI

```sh
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-5.0.1.3006-linux.zip
unzip sonar-scanner-cli-5.0.1.3006-linux.zip -d /opt
```

- https://docs.sonarsource.com/sonarqube/latest/analyzing-source-code/scanners/sonarscanner/

#### Inspect

- .env
> - SONARQUBE_URL=http://127.0.0.1:9000
> - SONAR_PROJECT_KEY=
> - SONAR_TOKEN=
> - TARGET_REPO=/path/to/repo


```sh
export $(cat .env | xargs)
```sh

```sh
docker run --rm \
    --network host \
    -e SONAR_HOST_URL=$SONARQUBE_URL \
    -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=$SONAR_PROJECT_KEY" \
    -e SONAR_TOKEN=$SONAR_TOKEN \
    -v $TARGET_REPO:/usr/src \
    sonarsource/sonar-scanner-cli
```    

```sh
sonar-scanner \
  -Dsonar.projectKey=$SONAR_PROJECT_KEY \
  -Dsonar.sources=$TARGET_REPO \
  -Dsonar.host.url=$SONARQUBE_URL \
  -Dsonar.token=$SONAR_TOKEN
```

```sh
mvn clean verify sonar:sonar \
  -Dsonar.projectKey=$SONAR_PROJECT_KEY \
  -Dsonar.projectName='${SONAR_PROJECT_KEY}' \
  -Dsonar.host.url=$SONARQUBE_URL \
  -Dsonar.token=$SONAR_TOKEN
```

### Vagrant

```sh
vagrant up
```

```sh
vagrant ssh-config
```

### Linux

```sh
sudo systemctl status sonar
```

## References 

- https://www.sonarsource.com/products/sonarqube/