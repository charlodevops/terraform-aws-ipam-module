output "ipam_id" {
  description = "AWS IPAM ID"
  value = aws_vpc_ipam_pool.global.id
}

output "private_scope_id" {
  description = "IPAM private scope ID"
  value       = aws_vpc_ipam.default.private_default_scope_id
}

output "public_scope_id" {
  description = "IPAM public scope ID"
  value       = aws_vpc_ipam.default.public_default_scope_id
}

