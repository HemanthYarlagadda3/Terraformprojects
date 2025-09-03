provider "aws" {
    region = "eu-north-1"
}

#creating a private vpc

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Hemanth VPC"
  }
}

# Creating a publicsubnet

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "Hemanth public subnet"
  }
}

#Creating a internet gateway to allow traffic

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Hemanth"
  }
}

#creating route table

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
tags = {
    Name = "hemanth route table"
  }
}

#Route table association

resource "aws_route_table_association" "association01" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.route.id
}

# creating security group

resource "aws_security_group" "newSGTF" {
    vpc_id      = aws_vpc.main.id

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }



  tags = {
    Name = "Hemanth_new_SG"
  }
}

#Creating ec2 instance with all above creation


resource "aws_instance" "example" {
  ami           = "ami-0c4fc5dcabc9df21d"
  instance_type = "t3.micro"
  associate_public_ip_address = true
  key_name = "LUNUX@2"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.newSGTF.id]
  
  tags = {
    Name = "Private vpc instance test"
  }
}

#output

# Output instance IP
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
