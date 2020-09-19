resource "aws_security_group" "allow_SSH" {
  vpc_id = var.vpc_id
  name = var.name

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