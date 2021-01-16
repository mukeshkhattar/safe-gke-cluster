
variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "us-central1"
}

variable "compute_engine_service_account" {
  type        = string
  description = "Service account to associate to the nodes in the cluster"
}

variable "subnet_ip" {
  type        = string
  description = "subnet_ip"
}

variable "master_auth_subnetwork_ip" {
  type        = string
  description = "master_auth_subnetwork_ip"
}


variable "pods_ip_range" {
  type        = string
  description = "pods_ip_range"
}

variable "svc_ip_range" {
  type        = string
  description = "svc_ip_range"
}

variable "environment" {
  type        = string
  description = "env"
}




