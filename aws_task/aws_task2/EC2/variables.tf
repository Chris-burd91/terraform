variable "ami-id" {
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

variable "vpc_security_group_ids" {
    default = "security_group_ids"
}

variable "subnet_id" {
    default = "public_subnet_id"
}

variable "tags" {
    default = "Webserver Node 1"
}