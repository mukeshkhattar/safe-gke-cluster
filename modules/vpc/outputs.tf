
output "network_name" {
  description = "The name of the VPC being created"
  value       = module.vpc.network_name
}

output "subnets_names" {
  description = "The names of the subnet being created"
  value       = module.vpc.subnets_names
}

output "network" {
  description = "The region in which the cluster resides"
  value       = module.vpc.network
}


output "project_id" {
  description = "The project ID the cluster is in"
  value       = module.vpc.project_id
}

