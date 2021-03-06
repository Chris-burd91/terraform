resource "aws_security_group" "wsg" {
  name        = var.name
  description = "Allow SSH connection"
  vpc_id      = var.vpc_id

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

  dynamic "egress" {
    iterator = port
    for_each = var.outbound-port
    content {
      from_port   = port.value
      protocol    = "tcp"
      to_port     = port.value
      cidr_blocks = [var.open-internet]
    }

  }
}