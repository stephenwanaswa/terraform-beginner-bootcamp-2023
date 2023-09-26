terraform {
  #cloud {
   # organization = "Bytetech"
#
   # workspaces {
   #   name = "terra-house-basketball"
  #  }
  #}
  required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
}
