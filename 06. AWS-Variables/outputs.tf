output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "ec2_public_ip" {
  value = aws_instance.example.public_ip
}
