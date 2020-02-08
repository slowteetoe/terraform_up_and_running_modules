variable "mysql_config" {
  description = "the config for the mysql DB"

  type = object({
    address = string
    port    = number
  })

  default = {
      address = "mock-mysql-address"
      port = 12345
  }
}
