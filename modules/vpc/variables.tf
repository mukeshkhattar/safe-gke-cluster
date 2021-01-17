
variable "project_id" {
  type        = string
  description = "The project ID to host the cluster in"
}

variable "region" {
  type        = string
  description = "The region to host the cluster in"
  default     = "us-central1"
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


variable "subnet_name" {
  type        = string
  description = "subnet_name"
}

variable "master_subnet_name" {
  type        = string
  description = "master_subnet_name"
}

variable "network_name" {
  type        = string
  description = "network_name"
}

variable "pods_range_name" {
  type        = string
  description = "pods_range_name"
}

variable "svc_range_name" {
  type        = string
  description = "svc_range_name"
}




