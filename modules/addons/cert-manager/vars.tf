variable "cm_enabled" {
  type = bool
  default = false
}

variable "cm_config" {
  type = object({
    name = string
    namespace = string
    version = string
    chart = string
    repository = string
    set = list(object({
      name = string
      value = string
    }))
  })
  default = {
    name = "cert-manager"
    chart = "cert-manager"
    namespace = "cert-manager"
    version = "v1.11.0"
    repository = "https://charts.jetstack.io"
    enabled = false
    set = [
      {
        name = "installCRDs"
        value = "true"
      }
    ]
  }
}

variable "set_values" {
  description = "Forced set values"
  type        = any
  default     = []
}