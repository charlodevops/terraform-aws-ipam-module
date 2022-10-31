data "aws_region" "current" {}

resource "aws_vpc_ipam" "default" {
  description = "${var.ipam_name} in ${data.aws_region.current.name} region"

  dynamic "operating_regions" {
    for_each = var.operating_regions
    content {
      region_name = operating_regions.key
    }
  }
  tags = {
    Name = var.ipam_name
  }
}

resource "aws_vpc_ipam_pool" "global" {
  address_family = "ipv4"
  ipam_scope_id  = aws_vpc_ipam.default.private_default_scope_id
}

resource "aws_vpc_ipam_pool_cidr" "global" {
  ipam_pool_id = aws_vpc_ipam_pool.global.id
  cidr         = var.global_cidr
}

resource "aws_vpc_ipam_pool" "regional" {
  for_each            = var.operating_regions
  address_family      = "ipv4"
  ipam_scope_id       = aws_vpc_ipam.default.private_default_scope_id
  locale              = each.key
  allocation_default_netmask_length = var.default_netmask
  source_ipam_pool_id = aws_vpc_ipam_pool.global.id
  tags = {
    Name = each.key
  }
}

resource "aws_vpc_ipam_pool_cidr" "regional" {
  for_each     = var.operating_regions
  ipam_pool_id = aws_vpc_ipam_pool.regional[each.key].id
  cidr         = each.value
}
