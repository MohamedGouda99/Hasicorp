provider "aws" {
  
  region  = var.aws_region

  default_tags {
    tags = {
      Environment = terraform.workspace
      Owner       = "Acme"
      Provisoned  = "Terraform"
    }

  }
}

# provider "vault" {
#   address = "http://127.0.0.1:8200"
#   token   = "hvs.7lhjVn0Og5jFN7xdrzx3xaFh"
# }