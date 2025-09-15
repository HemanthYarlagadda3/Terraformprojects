resource "aws_security_group" "HemanthSG1" {
  # ... other configuration ...
provider = aws.us-east-1

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 tags = {
    Name = "east"
  }
}

resource "aws_security_group" "HemanthSG2" {
  # ... other configuration ...
provider = aws.eu-north-1

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
tags = {
    Name = "north"
  }
}

resource "aws_instance" "hemantheast" {
  ami           = var.amieast_id
  instance_type = var.instanceeast_type
  key_name      = var.keyeast_name
  associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.HemanthSG1.id]
    provider = aws.us-east-1


  tags = {
    Name = "East server"
  }
}

resource "aws_instance" "hemanthnorth" {
  ami           = var.aminorth_id
  instance_type = var.instancenorth_type
  key_name      = var.keynorth_name
  associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.HemanthSG2.id]
   provider = aws.eu-north-1

  tags = {
    Name = "North server"
  }
}

