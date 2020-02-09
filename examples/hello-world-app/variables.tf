variable "mysql_config" {
  description = "the config for the mysql DB"

  type = object({
    address = string
    port    = number
  })

  default = {
    address = "mock-mysql-address"
    port    = 12345
  }
}

variable "environment" {
  description = "Name of the environment deploying to"
  type        = string
  default     = "example"
}
