variable "aws_region" {
  # default = "us-east-1"
  type    = string
  # validation {
  #   condition     = can(regex("^us-", var.aws_region))
  #   error_message = "The value of aws_region must be in the USA."
  # }
}

variable "vpc_cidr" {
  type    = string
  # default = "10.0.0.0/16"
  # validation {
  #   condition     = can(regex("^(?:[0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", var.vpc_cidr))
  #   error_message = "Must be an IP address of the form X.X.X.X/YY."
  # }
}

variable "vpc_name" {
  type    = string
  default = "vpc-hands-in"
}

variable "private_subnets" {
  type = map(number)
  default = {
    "private_subnet_1" = 1
    "private_subnet_2" = 2
    "private_subnet_3" = 3
  }

  # validation {
  #   condition     = abs([for k, v in var.private_subnets : can(regex("^private_subnet_\\d+$", k))])
  #   error_message = "Invalid private subnet name format. Subnet names should be in the format 'private_subnet_<number>'."
  # }

  # validation {
  #   condition     = abs([for k, v in var.private_subnets : v >= 1 && v <= 10])
  #   error_message = "Private subnet values should be integers between 1 and 10."
  # }
}

variable "public_subnets" {
  type = map(number)
  default = {
    "public_subnet_1" = 1
    "public_subnet_2" = 2
    "public_subnet_3" = 3
  }

  # validation {
  #   condition     = abs([for k, v in var.public_subnets : can(regex("^public_subnet_\\d+$", k))])
  #   error_message = "Invalid public subnet name format. Subnet names should be in the format 'public_subnet_<number>'."
  # }

  # validation {
  #   condition     = abs([for k, v in var.public_subnets : v >= 1 && v <= 10])
  #   error_message = "Public subnet values should be integers between 1 and 10."
  # }
}

variable "azs" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1d",
    "us-east-1e"
  ]
}

variable "ip" {
  type = map(any)
  default = {
    prod = "10.0.150.0/24"
    dev  = "10.0.250.0/24"
  }

}
variable "environment" {
  type = map(any)
  default = {
    prod = {
      ip = "10.0.150.0/24"
      az = "us-east-1a"
    }
    dev = {
      ip = "10.0.250.0/24"
      az = "us-east-1e"
    }
  }
}

variable "iam_policy_name" {
  type    = string
  default = "policy"
}


variable "num_1" {
  type        = number
  description = "Numbers for function labs"
  default     = 88
}

variable "num_2" {
  type        = number
  description = "Numbers for function labs"
  default     = 73
}

variable "num_3" {
  type        = number
  description = "Numbers for function labs"
  default     = 52
}

variable "ingress-rules" {
  type = map(object({
    description = string
    protocol    = string
    port        = string
    cidr_blocks = list(string)
  }))

  default = {
    "http" = {
      description = "Port 80"
      port        = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    },
    "https" = {
      description = "Port 443"
      port        = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "egress-rules" {
  type = map(object({
    description = string
    protocol    = string
    port        = string
    cidr_blocks = list(string)
  }))

  default = {
    "all" = {
      description = "allow all"
      protocol    = "-1"
      port        = 0
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

}