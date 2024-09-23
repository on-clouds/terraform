resource "helm_release" "k8sgpt" {
  count           = var.k8sgpt_config.enabled ? 1 : 0
  name             = var.k8sgpt_config.name
  timeout          = 1200
  create_namespace = true
  namespace        = var.k8sgpt_config.namespace
  lint             = true
  wait             = true
  chart = "k8sgpt-operator"
  version = "0.2.0"
  repository = "https://charts.k8sgpt.ai"
}

resource "helm_release" "k8sgpt-prereqs" {
  count     = var.k8sgpt_config.enabled ? 1 : 0
  chart     = "${path.module}/charts/k8sgpt-prereqs"
  name  = "k8sgpt-prereqs"
  version   = "1.0.0"
  namespace = var.k8sgpt_config.namespace

  set {
    name  = "openaiApiKey"
    value = var.ai_token
  }
}
