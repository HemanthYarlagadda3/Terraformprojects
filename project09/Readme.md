project created using namespaces - dev, stage , prod

   for creating name spaces - terraform workspace new namespacename
   for changing name soace - terraform workspace select namespace
   for listing current name space - terraform workspace list
   for identifying currentname space - terraform workspace list [ It highlight with * ]
   used 

     map module for creating infra based on name space

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
