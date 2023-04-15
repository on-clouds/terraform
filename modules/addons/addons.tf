module "argo" {
  source = "./argocd"
  argo_config = {
    name = "argo-cd"
    chart = "argo-cd"
    namespace = "argocd"
    version = "5.16.7"
    repository = "https://argoproj.github.io/argo-helm"
    enabled = var.argo_enabled
  }
  argo_envs = var.argo_envs
}

module "keptn" {
  source = "./keptn"
  keptn_config = {
    name = "keptn"
    chart = "klt"
    namespace = "keptn"
    version = "0.2.2"
    repository = "https://charts.lifecycle.keptn.sh"
    enabled = var.keptn_enabled
  }
}

module "cert-manager" {
  source = "./cert-manager"
  cm_enabled = var.cm_enabled
}

