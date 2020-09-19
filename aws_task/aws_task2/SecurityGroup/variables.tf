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

variable "vpc_id" {
  default = "vpc_id"
}

variable "name" {
  default = "WebSG"
}