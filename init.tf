terraform {
  required_version = ">= 1.2.0"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.20.0"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.11.0"
    }
    google = {
      source = "hashicorp/google"
      version = ">= 4.80.0"
    }
    null = {
      version = ">= 3.2.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.5.1"
    }
  }
}

provider "kubernetes" {
  cluster_ca_certificate = base64decode(var.gke_ca_certificate)
  host                   = "https://${var.gke_endpoint}"
  token                  = data.google_client_config.client.access_token
}

provider "helm" {
  kubernetes {
    cluster_ca_certificate = base64decode(var.gke_ca_certificate)
    host                   = "https://${var.gke_endpoint}"
    token                  = data.google_client_config.client.access_token
  }
}

data "google_client_config" "client" {}
