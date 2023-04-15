variable "cluster_name" {
  type        = string
  description = "The name of the cluster"
}

variable "cluster_location" {
    type        = string
    description = "The location of the cluster"
    default = "us-central1-a"
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

variable "project_id" {
  type        = string
  description = "The project ID to deploy to"
}

variable "disk_size_gb" {
    type        = number
    description = "The size of the disk in GB"
    default     = 40
}