# 04-advanced-hcl/main.tf
# COMPLETE FILE — count example

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Create VPC first
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vdm-count-demo-vpc"
  }
}

# count = 3 creates THREE subnets!
resource "aws_subnet" "public" {
  count = 3

  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.${count.index + 1}.0/24"

  tags = {
    Name = "vdm-public-subnet-${count.index + 1}"
  }
}

# Outputs show all subnet IDs
output "subnet_ids" {
  value = aws_subnet.public[*].id
}

output "subnet_cidrs" {
  value = aws_subnet.public[*].cidr_block
}