resource "helm_release" "cert-manager" {
  count            = var.cm_enabled ? 1 : 0
  name             = var.cm_config.name
  repository       = var.cm_config.repository
  chart            = var.cm_config.chart
  version          = var.cm_config.version
  timeout          = 1200
  create_namespace = true
  namespace        = var.cm_config.namespace
  lint             = true
  wait             = true
  values           = var.cm_config.set
}
