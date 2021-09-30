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