resource "aws_vpc" "VPC-1" {
    cidr_block = var.cidr_block
    tags = {
      Name = var.vpc_tags["Name"]
    }
}
resource "aws_subnet" "private_subnet" {
    vpc_id            = aws_vpc.VPC-1.id
    cidr_block        = var.private_subnet_cidr
    tags = {
      Name = var.private_subnet_tags["Name"]
    }
}
resource "aws_subnet" "public_subnet" {
    vpc_id            = aws_vpc.VPC-1.id
    cidr_block        = var.public_subnet_cidr
    map_public_ip_on_launch = true
    tags = {
      Name = var.public_subnet_tags["Name"]
    }
}
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.VPC-1.id
    tags = {
      Name = var.igw_tags["Name"]
    }
}
resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.VPC-1.id
    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
      Name=var.public_rt_tags["Name"]
    }
}
resource "aws_route_table_association" "public_rta" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
}
