# Creating an IKS cluster in Intersight using Terraform open source

This simple terraform plan for Intersight creates the minimum required pools and policies so that it can also create and deploy a kubernetes cluster profile

### Directions

1. Edit the `terraform.tfvars` file and put in your settings for:
    - apikey
    - secretkey
    - vc_password  
    - ssh_user     
    - ssh_key

2. Then edit `main.tf` and put in your cluster info

### Run the code using Terraform

Execute your Terraform plan using the following commands:
   - terraform init
   - terraform plan
   - terraform apply
