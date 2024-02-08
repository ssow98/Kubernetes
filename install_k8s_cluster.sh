#!/bin/bash

# Fonction pour installer Docker
install_docker() {
    sudo apt update
    sudo apt install -y docker.io
    sudo chmod 777 /var/run/docker.sock
    sudo systemctl start docker
    sudo systemctl enable docker
}

# Fonction pour installer Helm
install_helm() {
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod +x get_helm.sh
    ./get_helm.sh
}

# Fonction pour installer kubectl
install_kubectl() {
    sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl
}

# Fonction pour installer Minikube avec le driver Docker
install_minikube() {
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    sudo install minikube-linux-amd64 /usr/local/bin/minikube
    rm minikube-linux-amd64
}

# Installation de Docker, Helm, kubectl et Minikube
install_docker
install_helm
install_kubectl
install_minikube