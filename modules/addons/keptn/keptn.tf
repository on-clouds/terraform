resource "helm_release" "keptn" {
  count           = var.keptn_config.enabled ? 1 : 0
  name             = var.keptn_config.name
  timeout          = 1200
  create_namespace = true
  namespace        = var.keptn_config.namespace
  lint             = true
  wait             = true
  chart = "klt"
  version = "0.2.2"
  repository = "https://charts.lifecycle.keptn.sh"
}