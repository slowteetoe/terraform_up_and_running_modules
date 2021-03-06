terraform {
  required_version = ">= 0.12, < 0.13"

  # partial config, the remainder will be filled in by Terragrunt
  backend "s3" {}
}

provider "aws" {
  region = "us-west-2"

  version = "~> 2.0"
}

resource "aws_db_instance" "example" {
  identifier_prefix   = "terraform-up-and-running"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  name                = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
}

# data.aws_secretsmanager_secret_version.db_password.secret_string

# data "aws_secretsmanager_secret_version" "db_password" {
#   secret_id = "mysql-master-password-stage"
# }
