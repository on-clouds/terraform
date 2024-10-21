terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.14.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "6.8.0"
    }
  }
}

provider "helm" {
  kubernetes {
    host                   = module.gke-cluster.endpoint
    token                  = module.gke-cluster.token
    cluster_ca_certificate = base64decode(
      module.gke-cluster.cluster_ca_certificate,
    )
  }
}