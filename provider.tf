terraform {
  required_providers {
    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
    google-beta = {
      source = "hashicorp/google-beta"
      version = "4.62.0"
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