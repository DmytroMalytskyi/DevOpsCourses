variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "my_ip" {
  description = "Your IP (CIDR) for SSH to public EC2, e.g. 1.2.3.4/32"
  type        = string
}

variable "public_key_path" {
  description = "Path to your SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
