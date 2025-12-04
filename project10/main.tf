# Configure the AWS Provider
provider "aws" {
  region = "eu-north-1"
}

# Creating VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "Hemanth VPC"
  }
}

# Creating 1st subnet in eu-north-1a
resource "aws_subnet" "SN1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.0/28"
  availability_zone = "eu-north-1a"

  tags = {
    Name = "subnet 01"
  }
}

# Creating 2nd subnet in eu-north-1b
resource "aws_subnet" "SN2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.0.16/28"
  availability_zone = "eu-north-1b"

  tags = {
    Name = "subnet 02"
  }
}

# Creating internet gateway
resource "aws_internet_gateway" "Hemanthgw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Hemanth_GW"
  }
}

# Creating route table
resource "aws_route_table" "RouteHemanth" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Hemanthgw.id
  }

  tags = {
    Name = "Hemanth_Route"
  }
}

# Route table association for subnet 01
resource "aws_route_table_association" "FirstAssociation" {
  subnet_id      = aws_subnet.SN1.id
  route_table_id = aws_route_table.RouteHemanth.id
}

# Route table association for subnet 02
resource "aws_route_table_association" "SecondAssociation" {
  subnet_id      = aws_subnet.SN2.id
  route_table_id = aws_route_table.RouteHemanth.id
}

# Security group for EC2 instances
resource "aws_security_group" "Hemanth_SG" {
  name        = "Test_SG1"
  description = "Security group for AWS TF Script"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Hemanth_SG"
  }
}

# First EC2 instance
resource "aws_instance" "Instance01" {
  ami                         = "ami-0c4fc5dcabc9df21d" # Amazon Linux 2 in eu-north-1
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.Hemanth_SG.id]
  subnet_id                   = aws_subnet.SN1.id
  associate_public_ip_address = true
  key_name                    = "LUNUX@2"

  tags = {
    Name = "First Terraform"
  }
}

# Second EC2 instance
resource "aws_instance" "Instance02" {
  ami                         = "ami-0c4fc5dcabc9df21d" # Amazon Linux 2 in eu-north-1
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.Hemanth_SG.id]
  subnet_id                   = aws_subnet.SN2.id
  associate_public_ip_address = true
  key_name                    = "LUNUX@2"

  tags = {
    Name = "Second Terraform"
  }
}

# Output the public IPs
output "instance01_public_ip" {
  value = aws_instance.Instance01.public_ip
}

output "instance02_public_ip" {
  value = aws_instance.Instance02.public_ip
}

