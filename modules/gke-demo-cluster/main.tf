data "google_client_config" "default" {}

resource "google_service_account" "default" {
  account_id   = "sa-${var.cluster_name}"
  display_name = "Service Account - ${var.cluster_name}"
  project = var.project_id
}

resource "google_container_cluster" "gke-demo-cluster" {
  name     = var.cluster_name
  location = var.cluster_location
  project = var.project_id

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool-1-${var.cluster_name}"
  location   = var.cluster_location
  cluster    = google_container_cluster.gke-demo-cluster.name
  node_count = var.node_count
  project    = var.project_id
  disk_size_gb = var.disk_size_gb

  node_config {
    preemptible  = var.preemptible
    machine_type = var.node_machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}