output "vpc_id_1" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.main.id
}