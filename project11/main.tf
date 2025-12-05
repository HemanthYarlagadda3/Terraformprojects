terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.4"
}

provider "aws" {
  region = "eu-north-1"   # set your region
}

resource "aws_instance" "migrated" {
   ami                                  = "ami-0f50f13aefb6c0a5d"
   instance_type                        = "t3.micro"
   tags                                 = {
        "Name" = "Hemanth-Terraform-migration "
    }

 
  
}

