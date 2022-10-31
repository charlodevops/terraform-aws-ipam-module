variable "ipam_name" {
  type = string
}

variable "operating_regions" {
  type = map(string)
}

variable "global_cidr" {
  type = string
}

variable "default_netmask" {
  type = number
  default = 16
}