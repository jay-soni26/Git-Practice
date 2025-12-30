output "vpc_id" {
  value = aws_vpc.VPC-1.id
}
output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}
output "public_subnet_id" {
    value = aws_subnet.public_subnet.id
}
output "aws_internet_gateway" {
    value = aws_internet_gateway.igw.id
}
output "aws_route_table" {
    value = aws_route_table.public_rt.id
}