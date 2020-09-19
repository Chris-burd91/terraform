provider "aws" {
  access_key = "AKIAWNOJVC7DGXO7EGJP"
  secret_key = "HV27i9fH4KlNTaipV3FIocMV89WevWot9NIGMU+4"
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-04137ed1a354f54c4"
  instance_type = "t2.micro"
}


