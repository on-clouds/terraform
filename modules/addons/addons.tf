module "argo" {
  source = "./argocd"
  argo_enabled = var.argo_enabled
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

module "k8sgpt" {
  source = "./k8sgpt-operator"
  keptn_config = {
    name = "k8sgpt"
    namespace = "k8sgpt"
    enabled = var.k8sgpt_enabled
  }
  ai_token = var.k8sgpt_ai_token
}

module "cert-manager" {
  source = "./cert-manager"
  cm_enabled = var.cm_enabled
}

