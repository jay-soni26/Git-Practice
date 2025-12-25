provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "terafform" {
    ami = "ami-02b8269d5e85954ef"
    instance_type = "t3.micro"
    key_name = "Demo"
    vpc_security_group_ids = ["sg-08de88a7810b42a8f"]  
}       