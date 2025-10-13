provider "aws" {
    region = "eu-north-1"
}
resource "aws_instance" "example" {
  ami           = "ami-0c4fc5dcabc9df21d"
  instance_type = "t3.micro"
  key_name      = "LUNUX@2"
  subnet_id     = "subnet-0cbe0b341fabc2276"
  tags = {
    Name = "Tf.hemanth86"
  }
}
