resource "helm_release" "cert-manager" {
  count            = var.cm_enabled ? 1 : 0
  name             = var.cm_config.name
  timeout          = 1200
  create_namespace = true
  namespace        = var.cm_config.namespace
  lint             = true
  wait             = true
  chart            = "cert-manager"
  version          = "v1.16.1"
  repository       = "https://charts.jetstack.io"

  dynamic "set" {
    iterator = each_item
    for_each = try(var.cm_config["set"], null) != null ? distinct(concat(var.set_values, var.cm_config["set"])) : var.set_values

    content {
      name  = each_item.value.name
      value = each_item.value.value
      type  = try(each_item.value.type, null)
    }
  }
}
