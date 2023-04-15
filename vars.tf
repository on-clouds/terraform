variable "project_id" {
  type       = string
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "argo_enabled" {
  type       = bool
}

variable "cm_enabled" {
  type       = bool
}

variable "keptn_enabled" {
  type       = bool
}

variable "cluster_location" {
  type        = string
  description = "The location of the cluster"
}

variable "preemptible" {
  type        = bool
  description = "Whether to use preemptible nodes"
  default     = true
}

variable "node_count" {
  type        = number
  description = "The number of nodes in the cluster"
  default     = 1
}

variable "node_machine_type" {
  type        = string
  description = "The machine type of the nodes"
  default     = "n1-standard-1"
}

variable "argo_envs" {
  type = list(object({
    name    = string
    path    = string
    repoUrl = string
  }))
}

