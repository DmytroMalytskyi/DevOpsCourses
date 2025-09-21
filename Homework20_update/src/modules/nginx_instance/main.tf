provider "aws" {
  region = "eu-central-1"
}

resource "aws_security_group" "this" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.list_of_open_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.name}-sg" }
}

resource "aws_instance" "web" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.this.id]
  key_name                    = var.key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras enable docker
    yum install -y docker
    systemctl start docker
    systemctl enable docker

    LOCAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
    PUBLIC_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

    mkdir -p /home/ec2-user/nginx-html
    cat <<EOT > /home/ec2-user/nginx-html/index.html
    <html>
    <head><title>Terraform + Docker Nginx</title></head>
    <body style="font-family: Arial, sans-serif; text-align: center; margin-top: 50px;">
      <h1>Hello from Terraform + Docker Nginx!</h1>
      <p><b>Local IP:</b> $LOCAL_IP</p>
      <p><b>Public IP:</b> $PUBLIC_IP</p>
    </body>
    </html>
    EOT

    docker run -d -p 80:80 --name nginx --restart always \
      -v /home/ec2-user/nginx-html:/usr/share/nginx/html \
      nginx:stable
  EOF

  tags = { Name = var.name }
}
