resource "helm_release" "argo_cd" {
  count           = var.argo_config.enabled ? 1 : 0
  name             = var.argo_config.name
  repository       = var.argo_config.repository
  chart            = var.argo_config.chart
  version          = var.argo_config.version
  timeout          = 1200
  create_namespace = true
  namespace        = var.argo_config.namespace
  lint             = true
  wait             = true
}

resource "helm_release" "argo_demo_repo" {
  count = length(var.argo_envs)
  chart = "${path.module}/charts/argocd-application"
  name  = var.argo_envs[count.index].name
  version = "1.0.0"
  namespace = var.argo_config.namespace

  set {
    name  = "namespace"
    value = "argocd"
  }

  set {
    name  = "name"
    value = var.argo_envs[count.index].name
  }

  set {
    name  = "source.repoUrl"
    value = var.argo_envs[count.index].repoUrl
  }

  set {
    name = "source.path"
    value = var.argo_envs[count.index].path
  }

  depends_on = [helm_release.argo_cd]
}