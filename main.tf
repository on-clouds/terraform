provider "helm" {
  kubernetes {
    host                   = module.gke-cluster.endpoint
    token                  = module.gke-cluster.token
    cluster_ca_certificate = base64decode(
      module.gke-cluster.cluster_ca_certificate,
    )
  }
}

module "gke-cluster" {
  project_id        = var.project_id
  source            = "./modules/gke-demo-cluster"
  cluster_name      = var.cluster_name
  cluster_location  = var.cluster_location
  node_count        = var.node_count
  node_machine_type = var.node_machine_type
  preemptible       = var.preemptible
}

module "addons" {
  source        = "./modules/addons"
  argo_enabled  = true
  keptn_enabled = true
  cm_enabled    = true
  argo_envs     = var.argo_envs

  depends_on = [module.gke-cluster]
}