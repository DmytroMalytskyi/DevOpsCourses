
variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
  default     = 2
}

variable "ami_id" {
  description = "Ubuntu 22.04 LTS AMI ID (us-east-1)"
  type        = string
  default     = "ami-052efd3df9dad4825"
}

variable "key_name" {
  description = "Name of your AWS key pair"
  type        = string
  default     = "my-new-keypair"
}


variable "ansible_user" {
  description = "User for Ansible SSH connection"
  type        = string
  default     = "ubuntu"
}

variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
  default     = "/home/dmytro/.ssh/my-new-keypair.pem"
}
