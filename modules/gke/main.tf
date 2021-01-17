/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


data "google_client_config" "default" {
}

module "kubernetes-engine_safer-cluster" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/safer-cluster"
  version = "12.3.0"
  # insert the 9 required variables here
  kubernetes_version             = var.kubernetes_version
  name                           = var.name
  ip_range_pods                  = var.ip_range_pods
  ip_range_services              = var.ip_range_services
  network                        = var.network
  project_id                     = var.project_id
  compute_engine_service_account = var.compute_engine_service_account
  region                         = var.region
  subnetwork                     = var.subnetwork
  master_ipv4_cidr_block         = "172.16.0.0/28"
  master_authorized_networks = [
    {
      cidr_block   = var.master_auth_subnetwork_ip
      display_name = "VPC"
    },
  ]
}
