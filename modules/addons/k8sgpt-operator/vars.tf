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

variable "ai_token" {
    type = string
    default = "changeme"
    sensitive = true
}