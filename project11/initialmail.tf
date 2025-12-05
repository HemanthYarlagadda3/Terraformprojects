#This is intial mail terraform file created..just to import exising configuration


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
  
  
}
