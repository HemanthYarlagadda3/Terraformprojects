resource "aws_instance" "Hemanth" {
  ami                         = var.ami_value
  instance_type               = var.instance_type_value
  associate_public_ip_address  = true

  tags = {
    Name = "${title(terraform.workspace)}-YARL-HEM"
  }
}

