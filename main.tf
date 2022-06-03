terraform {

  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  backend "s3" {
    bucket = "terraform-bucket-state"
    key    = "aws-vm-provisioners/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"

  default_tags {
    tags = {
      owner      = "pablomarques"
      managed-by = "terraform"
    }
  }
}

module "network_vpc" {
  source = "./network-vpc-module"

  cidr_vpc    = "10.0.0.0/16"
  cidr_subnet = "10.0.1.0/24"
  environment = "desenvolvimento"
}