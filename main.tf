module "gcp_network" {
  source                         = "./modules/networking"
  project_id                     = local.env.project_id
  compute_engine_service_account = local.env.compute_engine_service_account
  region                         = local.env.region
  subnet_ip                      = local.env.subnet_ip
  master_auth_subnetwork_ip      = local.env.master_auth_subnetwork_ip
  pods_ip_range                  = local.env.pods_ip_range
  svc_ip_range                   = local.env.svc_ip_range
  environment                    = local.environment
}
