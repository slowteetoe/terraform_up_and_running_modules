
variable "cluster_name" {
  description = "the name to use for all the cluster resources"
  type        = string
}

variable "ami" {
  description = "AMI to run in the cluster"
  default     = "ami-06d51e91cea0dac8d"
  type        = string
}

variable "instance_type" {
  description = "type of EC2 instance to run (e.g. t2.micro)"
  default     = "t2.micro"
  type        = string
}

variable "min_size" {
  description = "the minimum number of instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "the maximum number of instances in the ASG"
  type        = number
}

variable "enable_autoscaling" {
  description = "If true, enable auto-scaling"
  type        = bool
  default     = false
}


variable "target_group_arns" {
  description = "The ARNs of ELB target groups in which to register Instances"
  type        = list(string)
  default     = []
}

variable "health_check_type" {
  description = "The type of health check to perform. Must be one of: EC2, ELB."
  type        = string
  default     = "EC2"
}

variable "user_data" {
  description = "The User Data script to run in each Instance at boot"
  type        = string
  default     = null
}

variable "custom_tags" {
  description = "Custom tags to set on the Instances in the ASG"
  type        = map(string)
  default     = {}
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  type        = number
  default     = 8080
}
