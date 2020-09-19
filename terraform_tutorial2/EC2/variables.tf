variable "ami" {
  description = "AMI ID of ubuntu 18.04LTS eu-west-1"
  default     = "ami-02df9ea15c1778c9c"
}

variable "instance-type" {
  description = "Free tier EC2 Instance type"
  default     = "t2.micro"
}

variable "pem-key" {
  description = "Associated Key to SSH into the EC2 Instance"
  default     = "CloudFormationKeyPair"
}

variable "subnet_id" {
  description = "subnet and id number for EC2"
  default     = "public_subnetA_id"

}

variable "vpc_security_group_ids" {
  default = "security_group_ids"
}

variable "associate_public_ip_address" {
  default = true
}

variable "tags" {
  default = "WebServers"
}

variable "user_data" {
  description = "Script for setting up which will be parsed to user_data"
  default = ""
}