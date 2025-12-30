variable "region" {
    default = "us-east-1"
}
variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "vpc_tags" {
    default = {
        Name = "My-VPC-1"
    }
}
variable "public_subnet_cidr" {
    default = "10.0.1.0/24"
}
variable "public_subnet_tags" {
    default = {
        Name = "public-Subnet"
    }
}
variable "private_subnet_cidr" {
    default = "10.0.2.0/24"
}
variable "private_subnet_tags" {    
    default = {
        Name = "private-Subnet"
    }
}

variable "igw_tags" {
    default = {
        Name = "My-IGW"
    }
}
variable "public_rt_tags" {
    default = {
        Name = "public-RT"
    }
}
