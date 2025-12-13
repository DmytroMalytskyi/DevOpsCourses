variable "project_name" { type = string  default = "student1" }
variable "aws_region"   { type = string  default = "eu-central-1" }

variable "cluster_version" { type = string default = "1.30" }

variable "desired_size" { type = number default = 1 }
variable "min_size"     { type = number default = 1 }
variable "max_size"     { type = number default = 2 }
