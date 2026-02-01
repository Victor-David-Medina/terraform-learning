#backend-setup/main.tf
  terraform {
    required_providers {
        aws = { source = "hashicorp/aws", version = "~> 5.0" }
    }
  }

provider "aws" { region = "us-east-1" }
  
resource "aws_s3_bucket" "terraform_state" {
    bucket = "vdm-terraform-state-DM"
    lifecycle { prevent_destroy = true }
    tags = { Name = "Terraform State" }
}

resource "aws_s3_bucket_versioning" "enabled" {
    bucket = aws_s3_bucket.terraform_state.id
    versioning_configuration { status = "Enabled" }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name         = "vdm-terraform-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}