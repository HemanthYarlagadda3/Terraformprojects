terraform {
  backend "s3" {
    bucket         = "hemanthterraform2"
    key            = "hemanth/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terraform_lock2"
  }
}
