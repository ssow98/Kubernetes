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
    helm install argocd argo/argo-cd -n argocd
}

# Installation de Nginx Ingress Controller et ArgoCD
install_nginx_ingress
install_argocd
