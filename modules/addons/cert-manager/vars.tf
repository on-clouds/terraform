variable "cm_enabled" {
  type = bool
  default = false
}

variable "cm_config" {
  type = object({
    name = string
    namespace = string
    set = list(object({
      name = string
      value = string
    }))
  })
  default = {
    name = "cert-manager"
    namespace = "cert-manager"
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