# Creating Sercurity Group for the Nginx

resource "aws_security_group" "nginx-sg" {
    name = "nginx-sg"
    description = "Allow HTTP, HTTPS and SSH inbound traffic"
    vpc_id = aws_vpc.my_vpc.id 

    # Inbound Rule for Http
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    # Outbound Rule for Http
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "nginx-sg"
    }
}