
output "public_instance_public_ip" {
  description = "Public IP of the bastion (public EC2)"
  value       = aws_instance.public_ec2.public_ip
}

output "private_instance_private_ip" {
  description = "Private IP of the private EC2"
  value       = aws_instance.private_ec2.private_ip
}
