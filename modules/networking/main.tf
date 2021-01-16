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

resource "random_string" "suffix" {
  length  = 4
  special = false
  upper   = false
}


locals {
  cluster_type           = "safer-cluster"
  network_name           = "safer-cluster-network-${var.environment}"
  subnet_name            = "safer-cluster-subnet-${var.environment}"
  master_subnet_name     = "safer-cluster-master-subnet-${var.environment}"
  pods_range_name        = "ip-range-pods-${random_string.suffix.result}"
  svc_range_name         = "ip-range-svc-${random_string.suffix.result}"
}

module "gcp-network" {
  source  = "terraform-google-modules/network/google"
  version = "~> 2.5"
  project_id   = var.project_id
  network_name =  local.network_name

  subnets = [
    {
      subnet_name   = local.subnet_name
      subnet_ip     = var.subnet_ip
      subnet_region = var.region
    },
    {
      subnet_name   = local.master_subnet_name
      subnet_ip     =  var.master_auth_subnetwork_ip
      subnet_region = var.region
    },
  ]

  secondary_ranges = {
    "${local.subnet_name}" = [
      {
        range_name    = local.pods_range_name
        ip_cidr_range = var.pods_ip_range
      },
      {
        range_name    = local.svc_range_name
        ip_cidr_range = var.svc_ip_range
      },
    ]
  }
}

data "google_client_config" "default" {
}
