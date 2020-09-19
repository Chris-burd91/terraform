provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-west-1"
  shared_credentials_file = "~/.aws/credentials"
}

module "aws_vpc" {
  source = "./VPC"
}

module "aws_webserver_sg" {
  source = "./SecurityGroup"
  name   = "WebServerSG"
  vpc_id = module.aws_vpc.vpc_id
  ingress_ports = [22,80,443]


}

module "webserver_node_1" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.security_group_ids
  tags = {
    Name = "WebServer_Node_1"
  }
}

data "template_file" "install_script" {
  template = file("${path.module}/EC2/scripts/update.sh")
}

module "webserver_node_2" {
  source                 = "./EC2"
  ami                    = var.centos-ami
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.security_group_ids
  user_data = data.template_file.install_script.template

  tags = {
    Name = "WebServer_Node_2"
  }



  associate_public_ip_address = true
}