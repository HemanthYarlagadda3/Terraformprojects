------------This project is created for import functinality-----------

-- Created infra using AWS UI - aws instance with name Terraform-Migration
--later from terraform console created one intialmain.tf file 

    resource "aws_instance" "migrated" {
   
#No content here..kept as blank wantedly to change post import
 
}

Now by using command - Terraform import aws-instance.migrated instanceid-orignalvalue 

terraform will import the entire configuration of that instance and state file is created automatically

To find the state of the instance use Terraform state show aws-instance.migrated

now by using state contents add these in terraform main.tf

   resource "aws_instance" "migrated" {
   ami                                  = "ami-0f50f13aefb6c0a5d"
   instance_type                        = "t3.micro"
   tags                                 = {
        "Name" = "Terraform-migration "
    }
}


Now used -- terraform plan ---to shows zero configuration , it means --we have successfully imported configuration to terraform

Now validating --if i made any any chanhes if tf code and apply...its need to apply in aws UI

changed name tag Terraform-migration to hemanth-Terraform-migration and applyed...it worked name has been successfully changed to my isntance validated imn aws UI
