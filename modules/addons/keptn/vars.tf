variable "keptn_config" {
  type = object({
    name = string
    namespace = string
    version = string
    chart = string
    repository = string
    enabled = bool
  })
  default = {
    name = "keptn"
    chart = "klt"
    namespace = "keptn"
    version = "0.2.2"
    repository = "https://charts.lifecycle.keptn.sh"
    enabled = false
  }
}