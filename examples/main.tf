terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      Environment = "POC"
    }
  }
}

module "aws_ipam" {
  source            = "../"
  ipam_name         = var.ipam_name
  global_cidr       = var.global_cidr
  operating_regions = var.operating_regions
}