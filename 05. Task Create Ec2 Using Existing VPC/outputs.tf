# outputs of the Terraform configuration for the EC2 instance using an existing VPC
output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.my_ec2.public_ip
}