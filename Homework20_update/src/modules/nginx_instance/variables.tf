variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "list_of_open_ports" {
  type = list(number)
}

variable "name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_id" {
  type = string
}
