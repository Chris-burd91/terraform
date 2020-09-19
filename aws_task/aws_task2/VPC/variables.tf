variable "cidr_block_1" {
  description = "Associated Cidr Block for VPC"
  default     = "10.0.0.0/16"
}

variable "cidr_block_2" {
  description = "Associated Cidr Block for VPC"
  default     = "10.0.1.0/24"
}

variable "open-internet" {
  type        = string
  description = "Open internet cidr block"
  default     = "0.0.0.0/0"

}