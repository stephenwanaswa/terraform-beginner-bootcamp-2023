terraform {
   required_providers {
     aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

#provider "aws" {
  # Configuration options
  # region = "us-east-1"
  # access_key="accesskey"
  # secret_key="secretkey"
#}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
data "aws_caller_identity" "current" {}