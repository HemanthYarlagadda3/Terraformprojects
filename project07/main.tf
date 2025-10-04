provider "aws" {
  region = "eu-north-1"
}
module "project" {
  source = "./module/project"
  instance_type_value = "t3.small"
}

