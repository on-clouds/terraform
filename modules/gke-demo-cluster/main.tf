data "google_client_config" "default" {}

resource "google_service_account" "default" {
  account_id   = "sa-${var.cluster_name}"
  display_name = "Service Account - ${var.cluster_name}"
  project = var.project_id
}

resource "google_container_cluster" "gke-demo-cluster" {
  provider = google-beta
  name     = var.cluster_name
  location = var.cluster_location
  project  = var.project_id

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool    = true
  initial_node_count          = 1
  enable_binary_authorization = true

  min_master_version = 1.12

  release_channel {
    channel = var.release_channel
  }

  network_policy {
    enabled = true
  }

  ip_allocation_policy {}

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  pod_security_policy_config {
    enabled = true
  }

  node_config {
    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_secure_boot = false
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = "03:00"
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool-1-${var.cluster_name}"
  location   = var.cluster_location
  cluster    = google_container_cluster.gke-demo-cluster.name
  node_count = var.node_count
  project    = var.project_id
  

  management {
    auto_upgrade = true
    auto_repair = true
  }

  node_config {
    preemptible  = var.preemptible
    machine_type = var.node_machine_type
    disk_size_gb = var.disk_size_gb
    image_type   = "COS"

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_secure_boot = false
    }
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}