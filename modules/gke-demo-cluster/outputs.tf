output "token" {
  value = data.google_client_config.default.access_token
}

output "endpoint" {
  value = "https://${google_container_cluster.gke-demo-cluster.endpoint}"
}

output "cluster_ca_certificate" {
  value = google_container_cluster.gke-demo-cluster.master_auth.0.cluster_ca_certificate
}