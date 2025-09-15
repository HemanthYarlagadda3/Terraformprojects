variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_id" {
  description = "EC2 ami_id"
  type        = string
  default     = "ami-0fd2b85ee2b4dc969"
}
 
variable "key_name" {
  description = "EC2 pem key"
  type        = string
  default     = "LUNUX@2"
}

