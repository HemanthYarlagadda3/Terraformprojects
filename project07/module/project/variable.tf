variable "instance_type_value" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami_value" {
  description = "EC2 ami_id"
  type        = string
  default     = "ami-04c08fd8aa14af291"
}

variable "key_name_value" {
  description = "EC2 pem key"
  type        = string
  default     = "LUNUX@2"
}

