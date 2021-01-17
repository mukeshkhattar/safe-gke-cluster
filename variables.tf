
# variables for terraform.tfvars.json

variable "environment_mapping" {
  type = map(any)
}


variable "environments" {
  type = map(
    object({
      project_id  = string
      compute_engine_service_account = string
      region= string
      subnet_ip = string
      master_auth_subnetwork_ip = string
      pods_ip_range= string
      svc_ip_range = string
      subnet_name = string
      master_subnet_name = string
    })
  )
}
