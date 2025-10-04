provider "aws" {
  region = "eu-north-1"
}

resource "aws_instance" "Hemanth" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  associate_public_ip_address = true
 key_name = var.key_name_value

  tags = {
    Name = "YARL>HEM"
  }
}

