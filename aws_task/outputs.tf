output "ec2_id" {
  value = aws_instance.EC2.id
}

output "ec2_ip" {
  value = aws_instance.EC2.public_ip
}

output "ec2_AZ" {
  value = aws_instance.EC2.availability_zone
}
