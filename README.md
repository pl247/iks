# Creating an IKS cluster in Intersight using Terraform open source

This simple terraform plan for Intersight creates an IP pool for the k8s nodes and a number of policies so that it can subsequently create a kubernetes cluster profile and optionally deploy it for you.

### Directions

1. Edit the `terraform.tfvars` file and put in your settings for:
    - apikey
    - secretkey
    - vc_password  
    - ssh_user     
    - ssh_key

2. Then edit `main.tf` and put in your cluster info following the examples that are currently in the file.

### Run the code using Terraform

Execute your Terraform plan using the following commands:
   - terraform init
   - terraform plan
   - terraform apply
