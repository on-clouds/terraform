resource "helm_release" "keptn" {
  count           = var.keptn_config.enabled ? 1 : 0
  name             = var.keptn_config.name
  repository       = var.keptn_config.repository
  chart            = var.keptn_config.chart
  version          = var.keptn_config.version
  timeout          = 1200
  create_namespace = true
  namespace        = var.keptn_config.namespace
  lint             = true
  wait             = true
}