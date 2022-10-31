output "ipam_id" {
  description = "AWS IPAM ID"
  value = module.aws_ipam.ipam_id
}

output "private_scope_id" {
  description = "IPAM private scope ID"
  value       = module.aws_ipam.private_scope_id
}

output "public_scope_id" {
  description = "IPAM public scope ID"
  value       = module.aws_ipam.public_scope_id
}

