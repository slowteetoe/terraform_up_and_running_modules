terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region  = "us-west-2"
  version = "~> 2.0"
}

module "mysql" {
  source = "../../data-stores/mysql"

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}
