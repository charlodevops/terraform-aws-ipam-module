variable "ipam_name" {
  default = "global-ipam"
  type    = string
}

variable "global_cidr" {
  default = "10.0.0.0/8"
  type    = string
}

variable "operating_regions" {
  type = map(string)
  default = {
    "us-east-1" = "10.1.0.0/16" #primary Region
    "us-west-1" = "10.2.0.0/16" #additional region
    "eu-west-1" = "10.3.0.0/16" #additional region
  }
}
