#!/bin/bash

# Fonction pour installer Nginx Ingress Controller via Helm
install_nginx_ingress() {
    helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace
}

# Fonction pour installer ArgoCD via Helm
install_argocd() {
    kubectl create namespace argocd
    helm repo add argo https://argoproj.github.io/argo-helm
    helm repo update
    helm install argocd argo/argo-cd -n argocd -f https://github.com/ssow98/Kubernetes/blob/main/apps/init_k8s_cluster.sh
}

install_argocd_cli(){
    curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
    sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
    rm argocd-linux-amd64
}

# Installation de Nginx Ingress Controller et ArgoCD
install_nginx_ingress
install_argocd
install_argocd_cli
