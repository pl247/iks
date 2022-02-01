provider "intersight" {
  apikey    = var.apikey
  secretkey = var.secretkey
  endpoint  = var.endpoint
}

module "iks_cluster" {
  source = "terraform-cisco-modules/iks/intersight//"
  version = "2.2.0"

# Kubernetes Cluster Profile
  cluster = {
    name                = "red-hx"
    action              = "Deploy"
    # action can be Unassign or Deploy. If Deploy set wait_for_completion to false
    wait_for_completion = false
    worker_nodes        = 3
    load_balancers      = 5
    worker_max          = 6
    control_nodes       = 1
    ssh_user            = var.ssh_user
    ssh_public_key      = var.ssh_key
  }

  ip_pool = {
    use_existing        = false
    name                = "red-pool"
    ip_starting_address = "172.22.100.100"
    ip_pool_size        = "100"
    ip_netmask          = "255.255.255.0"
    ip_gateway          = "172.22.100.1"
    dns_servers         = ["172.22.16.254"]
  }

  sysconfig = {
    use_existing = false
    name         = "red-dns-ntp"
    domain_name  = "wpglab.ca"
    timezone     = "America/Winnipeg"
    ntp_servers  = ["172.22.16.254"]
    dns_servers  = ["172.22.16.254"]
  }

  k8s_network = {
    use_existing = false
    name         = "red-pod-service-cidr"
    pod_cidr     = "100.63.0.0/16"
    service_cidr = "100.62.0.0/24"
    cni          = "Calico"
  }
  # Version policy
  versionPolicy = {
    useExisting   = false
    policyName     = "red-iks-version"
    iksVersionName = "1.20.14-iks.0"
  }

  # Trusted registry policy
  tr_policy = {
     use_existing = false
     create_new   = false
  }

  runtime_policy = {
    use_existing = false
    create_new   = false
  }

  # Infra Config Policy Information
  infraConfigPolicy = {
    use_existing    = false
    platformType = "esxi"
    #platformType "iwe" or "esxi"
    policyName      = "red-vminfra"
    vcTargetName   = "172.22.163.101"
    interfaces    = ["k8s-100"]
    vcDatastoreName     = "HX-Datastore-9T"
    vcClusterName       = "HX"
    vcResourcePoolName = ""
    vcPassword      = var.vc_password
  }

  addons = [
    {  
    createNew = true    
    addonPolicyName = "red-smm"
    addonName = "smm"
    description = "Service Mesh Manager Addon Policy"
    upgradeStrategy = "AlwaysReinstall"
    installStrategy = "InstallOnly"
    releaseVersion = "1.8.1-cisco2-helm3"
    overrides = yamlencode({"demoApplication":{"enabled":true}})
    }
  ]

  # Worker node instance type
  instance_type = {
    use_existing = false
    name         = "red-vm-16GB"
    cpu          = 4
    memory       = 16386
    disk_size    = 40
  }

  # Organization and Tag
  organization = var.organization
  tags         = var.tags
}


