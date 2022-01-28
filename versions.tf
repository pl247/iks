terraform {

  /*
  To use remote state and leverage Terraform Cloud for Business uncomment this backend code block
  and set the organization and workspace strings.

   backend "remote" {
    organization = "Cisco-Richfield-Lab"

    workspaces {
      name = "pl-iks"
    }
  }
  */

  required_version = ">=0.14.5"

  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.19"
    }
  }
}
