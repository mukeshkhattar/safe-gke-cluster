locals {
  env_name    = lookup(var.environment_mapping, terraform.workspace, "dev")
  env         = var.environments[local.env_name]
  environment = terraform.workspace
}
