module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.5"

  name = "${var.project_name}-vpc"
  cidr = "10.50.0.0/16"

  azs             = ["${var.aws_region}a", "${var.aws_region}b"]
  public_subnets  = ["10.50.1.0/24", "10.50.2.0/24"]
  enable_nat_gateway = false
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = { Project = var.project_name }
}
