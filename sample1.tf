//Terraform Block
terraform {
  backend "s3" {
    bucket         = "terraform-dependency"
    region         = "us-east-1"
    key = "tfstate"
   // encrypt        = true(optional)
  }
}


//provider Block
provider "aws" {
    region = "us-east-1"
  
}
//resource Block
resource "aws_instance" "terafform" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    vpc_security_group_ids = ["sg-04058ffdbb7be7e26"]  
    tags = {
      name= "my instance"
    }
}   
//variables Block
variable "ami_id" {  
  default = "ami-0c2b8ca1dad447f8a"
}

variable "instance_type" {
  default = "t3.micro"
}
variable "key_name" {
    default = "Demo"
  
}


//outputs Block
output "instance_id" {
  value = aws_instance.terafform.id
}
output "instance_public_ip" {
  value = aws_instance.terafform.public_ip
}
