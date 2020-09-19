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

variable "cidr_block_1" {
  description = "Associated Cidr Block for VPC"
  default     = "10.0.0.0/16"
}

variable "cidr_block_2" {
  description = "Associated Cidr Block for subnet"
  default     = "10.0.1.0/24"
}

variable "ingress_ports" {
  type        = list(number)
  description = "List of ingress ports"
  default     = [22]
}

variable "open-internet" {
  type        = string
  description = "Open internet cidr block"
  default     = "0.0.0.0/0"

}

