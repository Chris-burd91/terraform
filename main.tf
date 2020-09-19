provider "aws" {
  region = "eu-west-1"
}

variable "ami" {
  description = "machine image"
  default     = "ami-04137ed1a354f54c4"
}

variable "type" {
  # instance type
  /*
        This will determine how many CPU and RAM will be assigned
    */
  default = "t2.micro"
}

resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.type
}
