# Creating the VPC

resource "aws_vpc" "My_VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "My_VPC"
  }
}

# Creating the Private Subnet

resource "aws_subnet" "Private_Subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.My_VPC.id

    tags = {
      Name = "Private_Subnet"
    }
}

# Creating the Public Subnet

resource "aws_subnet" "Public_Subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.My_VPC.id

    tags = {
      Name = "Public Subnet"
    }
}

# Creating the Internet Gateway

resource "aws_internet_gateway" "My_Internet_Gateway" {
  vpc_id = aws_vpc.My_VPC.id

  tags = {
    Name = "My_Internet_Gateway"
  }
}

# Creating the Route Table

resource "aws_route_table" "My_Route_table" {
    vpc_id = aws_vpc.My_VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.My_Internet_Gateway.id
    }
}
  
