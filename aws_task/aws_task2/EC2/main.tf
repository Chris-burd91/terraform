resource "aws_instance" "EC2" {
  ami                         = var.ami-id
  instance_type               = var.instance-type
  key_name                    = var.pem-key
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [var.vpc_security_group_ids]
  tags = var.tags
}
