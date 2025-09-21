
# Дані AMI для Amazon Linux 2
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

# Модуль Network
module "network" {
  source             = "./modules/network"
  name               = var.name
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
}

# Модуль Nginx
module "nginx" {
  source             = "./modules/nginx_instance"
  vpc_id             = module.network.vpc_id
  subnet_id          = module.network.public_subnet_id
  list_of_open_ports = var.list_of_open_ports
  name               = var.name
  key_name           = var.key_name
  instance_type      = var.instance_type
  ami_id             = data.aws_ami.amazon_linux_2.id
}
