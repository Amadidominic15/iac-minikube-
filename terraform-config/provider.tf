
terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.5.0"
    }
  }

  backend "local" {
    path = "./terraform.tfstate"
  }
}

provider "minikube" {
  kubernetes_version = "v1.33.1"
}

provider "kubernetes" {
  host                   = minikube_cluster.minikube_docker.host
  client_certificate     = minikube_cluster.minikube_docker.client_certificate
  client_key             = minikube_cluster.minikube_docker.client_key
  cluster_ca_certificate = minikube_cluster.minikube_docker.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}