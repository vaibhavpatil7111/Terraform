# Creating the VPC  

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my_vpc"
  }
}

# Creating Private Subnet

resource "aws_subnet" "private_subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags ={
        Name = "private_subnet"
    }
}

# Creating Public Subnet

resource "aws_subnet" "public_subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.my_vpc.id
    tags ={
        Name = "public_subnet"
    }
}

# Creating the Internet Gateway

resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "my_internet_gateway"
  }
}

# Creating the Route Table

resource "aws_route_table" "my_route_table" {
    vpc_id = aws_vpc.my_vpc.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_internet_gateway.id
    }
}
  
# Creating the Route Table Association to asset the above ip address

resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.public_subnet.id
}