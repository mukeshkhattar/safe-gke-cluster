# Safer GKE Cluster

This example illustrates how to instantiate the opinionated Safer Cluster module.

```
terraform workspace new dev
terraform workspace select dev
terraform init
terraform plan
terraform apply

```

after testing apply changes to prod
```
terraform workspace new prod
terraform workspace select prod
terraform init
terraform plan
terraform apply

```
