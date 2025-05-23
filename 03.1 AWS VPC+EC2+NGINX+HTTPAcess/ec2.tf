# Creating EC2 Instace For Ngnix Setup 

resource "aws_instance" "ngnixserver" {
    ami = "ami-04f7a54071e74f488"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.nginx-sg.id]
    associate_public_ip_address = true 
    user_data = <<-EOF

    #!/bin/bash
    sudo apt update -y
    sudo apt install ngnix -y
    sudo systemctl start ngnix

    EOF

 tags = {
    Name = "Ngnixserver"
  } 
}