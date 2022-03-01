# Creating an IKS cluster in Intersight using Terraform open source

This simple terraform plan for Intersight creates an IP pool for the k8s nodes and a number of policies so that it can subsequently create a kubernetes cluster profile and optionally deploy it for you.

### Directions

1. Create a file called `terraform.tfvars` file and put in it:

```
apikey       = "replace_with_your_api_key"
secretkey    = "SecretKey.txt"
vc_password  = "replace_with_your_vc_password"
ssh_user     = "iksadmin"
# ssh key can be made with: ssh-keygen -t ecdsa -b 521 -f mykey  
ssh_key      = "replace_with_your_ssh_key"

tags = [
  {
    "key" : "Orchestrator"
    "value" : "Terraform"
  },
  {
    "key" : "Environment"
    "value" : "K8S-Prod"
  }
]
organization = "default"
```


2. Then edit `main.tf` and put in your cluster info following the examples that are currently in the file.

### Run the code using Terraform

Execute your Terraform plan using the following commands:
   - terraform init
   - terraform plan
   - terraform apply
   
### Removing a cluster using Terraform

You can remove the cluster using the `terraform destroy` command, but the pool delete will error out. This is because the pool IPs will still be in use while the cluster is unconfiguring in Intersight. As a workaround, just wait until the unconfigure task completes and then run the destroy again and the pool will be removed.

### Updates

- updated terraform version to 1.1
- updated intersight provider to 1.0.22
