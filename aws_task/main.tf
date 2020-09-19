
provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

resource "aws_instance" "EC2" {
  ami                         = var.ami-id
  instance_type               = var.instance-type
  key_name                    = var.pem-key
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_SSH.id]
  tags = {
    Name = "EC2 Instance"
  }
}

resource "aws_vpc" "main" {
  cidr_block = var.cidr_block_1
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_2
}

resource "aws_security_group" "allow_SSH" {
  vpc_id = aws_vpc.main.id

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.open-internet]
    }
  }
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.open-internet
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.r.id
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}


