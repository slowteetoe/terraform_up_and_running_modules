provider "aws" {
  region  = "us-west-2"
  version = "~> 2.0"
}

module "hello-world-app" {
  source = "../../services/hello-world-app"

  server_text = "hola"
  environment = "example"

  mysql_config = var.mysql_config

  ami                = "ami-06d51e91cea0dac8d"
  instance_type      = "t2.micro"
  min_size           = 2
  max_size           = 2
  enable_autoscaling = false
}
