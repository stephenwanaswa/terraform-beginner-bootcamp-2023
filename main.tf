
terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
# backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "Bytetech"

#     workspaces {
#      name = "terra-house-basketball"
#     }
#   }
  
  cloud {
    organization = "Bytetech"

    workspaces {
      name = "terra-house-basketball"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
module "home_medievil_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.medievil.public_path
  content_version = var.medievil.content_version
}

resource "terratowns_home" "home_medievil" {
  name = "Medievil Tips!"
  description = <<DESCRIPTION
MediEvil is an action-adventure video game released for the PlayStation in 1998. Developed by Millennium Interactive, the game blends elements of action, platforming, and dark humor.
DESCRIPTION
   domain_name = module.home_medievil_hosting.domain_name
  #domain_name = "3fdaq3gz.cloudfront.net"
  town = "missingo"
  content_version = var.medievil.content_version
}


module "home_hiking_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.hiking.public_path
  content_version = var.medievil.content_version
}

resource "terratowns_home" "home_hiking" {
  name = "Hiking Club"
  description = <<DESCRIPTION
For the love of hiking
DESCRIPTION
   domain_name = module.home_hiking_hosting.domain_name
  #domain_name = "3fdaq3gz.cloudfront.net"
  town = "missingo"
  content_version = var.hiking.content_version
}



