# Install

```sh
# Docker
sudo apt update
sudo apt install git
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io awscli
sudo systemctl enable docker
sudo usermod -aG docker ubuntu

# Docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Minikube
egrep --color 'vmx|svm' /proc/cpuinfo
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
    && chmod +x minikube
sudo cp minikube /usr/local/bin && rm minikube
sudo apt-get install -y virtualbox

sudo apt-get install -y conntrack
cd /usr/bin/
sudo ln -s /usr/sbin/conntrack conntrack

sudo minikube start --driver=none

```

# Docker

```sh
docker push [image]
```

# Kubernetes

```sh
kubectl apply -f axul-user.yaml

kubectl get all
```

# Helm

```sh
curl -LO https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz
tar -xzf helm-v3.7.0-linux-amd64.tar.gz
cd linux-amd64 # El nombre del folder que descomprimio
sudo cp helm /usr/local/bin

helm version
```

# Terraform

tf/env.tfvars

```go
access_key = ""
secret_key = ""
```

```sh
terraform apply -var-file="env.tfvars"
```

# RPi

## Database

```sh
sudo apt-get update
sudo apt install mariadb-server

sudo mysql_secure_installation

sudo mysql -u root -p

> CREATE DATABASE axul_user;
> CREATE DATABASE axul_contact;
> CREATE DATABASE axul_event;
> CREATE DATABASE axul_notification;

```

## Go

```sh
mkdir ~/src && cd ~/src
wget https://dl.google.com/go/go1.14.4.linux-armv6l.tar.gz

sudo tar -C /usr/local -xzf go1.14.4.linux-armv6l.tar.gz
rm go1.14.4.linux-arm64.tar.gz

nano ~/.profile

PATH=$PATH:/usr/local/go/bin
GOPATH=$HOME/go

source ~/.profile
```

## Mysql

Instalar y configurar mysql a nivel local

```sh
# Migrate data in docker
mysql -u root --host [docker host] --port [docker port] axul_contact > ./contacts.sql -p

```
