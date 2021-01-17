
resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}

locals {
  network_name    = "safer-cluster-network-${local.environment}"
  pods_range_name = "ip-range-pods-${random_string.suffix.result}"
  svc_range_name  = "ip-range-svc-${random_string.suffix.result}"
  cluster_name = "${local.environment}-cluster"
}


module "vpc" {
  source                    = "./modules/vpc"
  project_id                = local.env.project_id
  region                    = local.env.region
  subnet_ip                 = local.env.subnet_ip
  master_auth_subnetwork_ip = local.env.master_auth_subnetwork_ip
  pods_ip_range             = local.env.pods_ip_range
  svc_ip_range              = local.env.svc_ip_range
  subnet_name               = local.env.subnet_name
  master_subnet_name        = local.env.master_subnet_name
  network_name              = local.network_name
  pods_range_name           = local.pods_range_name
  svc_range_name            = local.svc_range_name
}


module "gke" {
  source                         = "./modules/gke"
  authenticator_security_group   = "gke-security-groups@test.joonix.net"
  kubernetes_version             = "latest"
  name                           = local.cluster_name
  ip_range_pods                  = local.pods_range_name
  ip_range_services              = local.svc_range_name
  network                        = module.vpc.network_name
  project_id                     = module.vpc.project_id
  compute_engine_service_account = local.env.compute_engine_service_account
  master_auth_subnetwork_ip      = local.env.master_auth_subnetwork_ip
  region                         = local.env.region
  subnetwork                     = module.vpc.subnets_names[index(module.vpc.subnets_names, local.env.subnet_name)]
}



terraform {
  required_version = "~> 0.14.4"
  required_providers {
    google = "~> 3.52.0"
    googlebeta = {
      source  = "hashicorp/google-beta"
      version = "~> 3.52.0" # for enabling private services access
    }
  }
}


data "google_client_config" "default" {
}
