#!/bin/bash
export PATH=$PATH:/usr/local/bin
#sudo -i
#sudo apt update
#sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common python3-pip -y
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt-get update
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io awscli
#sudo systemctl enable docker
#sudo usermod -aG docker ubuntu

#docker compose
#sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo chmod +x /usr/local/bin/docker-compose


# new docker install

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# git
sudo apt install git

#mysql
sudo apt-get install mysql-server -y

sudo mysql
CREATE DATABASE mynewdatabase;
SHOW DATABASES;

CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mypassword';

SELECT user,authentication_string,plugin,host FROM mysql.user;

# Si tienes problemas para cambiar la contraseña
SHOW VARIABLES LIKE 'validate_password%';
SET GLOBAL validate_password.policy = 0;
SET GLOBAL validate_password.length = 4;
SET GLOBAL validate_password.check_user_name = 0;

# si no se puede entrar desde la app fijarse que tiene configurado el usuario root
SELECT host FROM mysql.user WHERE User = 'root';
# configurarle el host '%'
CREATE USER 'root'@'%' IDENTIFIED BY 'some_pass';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;

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

# Helm
cd /home/ubuntu
curl -LO https://get.helm.sh/helm-v3.7.0-linux-amd64.tar.gz
tar -xzf helm-v3.7.0-linux-amd64.tar.gz
cd linux-amd64 # El nombre del folder que descomprimio
sudo cp helm /usr/local/bin

cd ~
sudo sudo apt-get install git-all
#git clone https://github.com/ncostamagna/axul_contact.git
#git clone https://github.com/ncostamagna/axul_user.git
git clone https://github.com/ncostamagna/procrear-bot.git
git clone https://github.com/ncostamagna/axul_events_scheduler.git

# Golang
sudo snap install go --classic