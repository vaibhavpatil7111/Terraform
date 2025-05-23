output "instance_public_ip" {
    description = "The Public IP Address of the EC2 Instance"
    value = aws_instance.ngnixserver.public_ip
}

output "instance_url" {
    description = "The URL To Access The Nginx Server"
    value = "https://${aws_instance.ngnixserver.public_ip}"
  
}