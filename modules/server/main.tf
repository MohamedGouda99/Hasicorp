
resource "aws_instance" "web" {
  ami                    = var.ami
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_groups
  instance_type          = var.size
}


