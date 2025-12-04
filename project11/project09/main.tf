<<<<<<< HEAD
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.4"
}

=======
>>>>>>> c73f3523a00907731becfb218372d8309553e7d0
provider "aws" {
  region = "eu-north-1"
}

<<<<<<< HEAD
resource "aws_instance" "migrated" {
   ami                                  = "ami-0f50f13aefb6c0a5d"
  instance_type                        = "t3.micro"
  tags = {
    Name = "Hemanth-Terraform-migration"
  }

}


=======
variable "ami_value" {
  description = "EC2 AMI ID"
}

variable "instance_type_value" {
  description = "EC2 instance type"
   type = map(string)

  default = {
    "dev" = "t3.micro"
    "stage" = "t3.medium"
    "prod" = "t3.large"
  } 
}

module "project" {
  source              = "./module/ec2-creation"
  ami_value           = var.ami_value
  instance_type_value = lookup(var.instance_type_value, terraform.workspace, "t3.small")
}
>>>>>>> c73f3523a00907731becfb218372d8309553e7d0

