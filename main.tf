module "gke-cluster" {
  project_id        = var.project_id
  source            = "./modules/gke-demo-cluster"
  cluster_name      = var.cluster_name
  cluster_location  = var.cluster_location
  node_count        = var.node_count
  node_machine_type = var.node_machine_type
  preemptible       = var.preemptible
  disk_size_gb      = var.disk_size_gb
}

module "addons" {
  source        = "./modules/addons"
  argo_enabled  =var.argo_enabled
  keptn_enabled = var.keptn_enabled
  cm_enabled    = var.cm_enabled
  argo_envs     = var.argo_envs
  k8sgpt_enabled = var.k8sgpt_enabled

  depends_on = [module.gke-cluster]
}