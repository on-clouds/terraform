variable "argo_enabled" {
  type = bool
  default = false
}

variable "argo_config" {
  type = object({
    name = string
    namespace = string
    version = string
    chart = string
    repository = string
  })
  default = {
    name = "argo-cd"
    chart = "argo-cd"
    namespace = "argocd"
    version = "5.29.1"
    repository = "https://argoproj.github.io/argo-helm"
    enabled = false
  }
}

variable "argo_envs" {
  type = list(object({
    name = string
    path = string
    repoUrl = string
  }))
  default = [
    {
      name    = "dev"
      path    = "infra/dev"
      repoUrl = ""
    }
  ]
}