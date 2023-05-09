variable "argo_enabled" {
  type = bool
  default = false
}

variable "keptn_enabled" {
  type = bool
  default = false
}

variable "cm_enabled" {
  type = bool
  default = false
}

variable "argo_envs" {
  type = list(object({
    name = string
    path = string
    repoUrl = string
  }))
}

variable "k8sgpt_enabled" {
  type = bool
  default = false
}

variable "k8sgpt_config" {
  type = object({
    name = string
    namespace = string
    enabled = bool
  })
  default = {
    name = "k8sgpt"
    namespace = "k8sgpt"
    enabled = false
  }
}

variable "k8sgpt_ai_token" {
  type = string
  default = ""
  sensitive = true
}