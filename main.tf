
terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
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

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home" {
  name = "Text based games!"
  description = <<DESCRIPTION
Text-based games, also known as text games or interactive fiction, are a genre of video games that rely primarily on text to convey the game's story, world, and interactions. These games have been around since the early days of computing and are characterized by their absence of graphics or visual elements, relying solely on text descriptions and user input
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdaq3gz.cloudfront.net"
  town = "missingo"
  content_version = 1
}

