terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "us-west-2"
  version = "~> 2.0"
}

module "alb" {
  source = "../../networking/alb"

  alb_name   = var.alb_name
  subnet_ids = data.aws_subnet_ids.default.ids
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}