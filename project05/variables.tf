variable "instanceeast_type"{

description = "East region Instance type"
  type        = string
  default     = "t2.micro"
}

variable "instancenorth_type"{

description = "North region Instance type"
  type        = string
  default     = "t3.micro"
}

variable "amieast_id"{

description = "East region ami"
  type        = string
  default     = "ami-0b09ffb6d8b58ca91"
}

variable "aminorth_id"{

description = "North region ami"
  type        = string
  default     = "ami-0fd2b85ee2b4dc969"
}

variable "keyeast_name"{

description = "East region key pair"
  type        = string
  default     = "EAST@2"
}

variable "keynorth_name"{

description = "North region key pair"
  type        = string
  default     = "LUNUX@2"
}

