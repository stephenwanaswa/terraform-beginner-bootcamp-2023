
terraform {
#backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "Bytetech"

  #  workspaces {
  #    name = "terra-house-basketball"
  #  }
  #}
  
  #cloud {
   # organization = "Bytetech"
#
   # workspaces {
   #   name = "terra-house-basketball"
  #  }
  #}
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}

