variable "name" {
  description = "Resource name prefix"
  type        = string
  default     = "dmytro"
}

variable "list_of_open_ports" {
  description = "List of TCP ports to open"
  type        = list(number)
  default     = [22, 80]
}

variable "key_name" {
  description = "Existing EC2 key pair name to attach"
  type        = string
  default     = "my-keypair"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
