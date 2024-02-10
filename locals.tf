locals {
  maximum = max(var.num_1, var.num_2, var.num_3)
  minimum = min(var.num_1, var.num_2, var.num_3, 44, 20)
}
locals {
  service_name = "Automation"
  app_team     = "Cloud Team"
  createdby    = "terraform"
}


locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Name      = join("-", [local.service_name, local.app_team, local.createdby])
    Service   = lower(local.service_name)
    AppTeam   = lower(local.app_team)
    CreatedBy = lower(local.createdby)
  }
}

locals {
  ingress_rules = [
    {
      port        = 443
      description = "allow port 443"
    },
    {
      port        = 80
      description = "allow port 80"
    }
  ]
}