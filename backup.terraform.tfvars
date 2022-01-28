
# Required Varilables
apikey       = "59af0e11f11aa10001678016/59af0ceef11aa100016748f0/61f043507564612d33eda2d3"
secretkey    = "SecretKey.txt"
vc_password  = "Cisco123!"
ssh_user     = "iksadmin"
ssh_key      = "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAB76YvE42Uf9hsWPuMmlib5w0tjYKsMF+WvaSkP5CHT8DVkfZZbH/jIfQr1rdnhxO4HFapwxcF/rhxrw+9GU4ofqQAYXc2anFuPGsVAThpcLJmzfpPTCotIoOmjxHorEWg1Lgp7XBrjUTVTZGlSraPQ8tRi7KWatThnOG4mB3yvfsjATQ== plemaist@PLEMAIST-M-W5LY"

# Optional Variables
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
organization = "default" # Change this if a different org is required.  Default org is set to "default"