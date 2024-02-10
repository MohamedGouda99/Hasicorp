variable "ami" {
  type        = string
  description = "Instance ami"
}

variable "size" {}

variable "subnet_id" {}

variable "security_groups" {
  type = list(any)
}