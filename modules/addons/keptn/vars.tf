variable "keptn_config" {
  type = object({
    name = string
    namespace = string
    enabled = bool
  })
  default = {
    name = "keptn"
    namespace = "keptn"
    enabled = false
  }
}