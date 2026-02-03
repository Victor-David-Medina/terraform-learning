# 05-capstone/outputs.tf

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "nat_gateway_ip" {
  description = "NAT Gateway IP"
  value       = module.vpc.nat_gateway_ip
}

output "web_security_group" {
  description = "Web security group ID"
  value       = module.security.web_sg_id
}

output "db_security_group" {
  description = "DB security group ID"
  value       = module.security.db_sg_id
}