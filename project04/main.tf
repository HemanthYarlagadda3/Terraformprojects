resource "aws_security_group" "HemanthSG" {
  # ... other configuration ...

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "hemanth" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.HemanthSG.id]


  tags = {
    Name = "Structure Tf"
  }
}
