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