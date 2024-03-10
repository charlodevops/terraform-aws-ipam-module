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
    "us-east-1" = "10.1.0.0/16"
    "us-west-1" = "10.2.0.0/16"
    "eu-west-1" = "10.3.0.0/16"
  }
}

variable "default_netmask" {
  type = number
  default = 16
}
