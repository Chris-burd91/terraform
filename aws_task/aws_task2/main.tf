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
  vpc_id = module.aws_vpc.vpc_id_1
  


}

module "webserver_node_1" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnet_id
  vpc_security_group_ids = module.aws_webserver_sg.security_group_ids
  tags = {
    Name = "Chris's VM"
  }
}

