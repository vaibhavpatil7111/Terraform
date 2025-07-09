terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.31.0"
        }
  }
}

provider "aws" {
    region = "us-west-2"
}

locals {
  project = "project-0"
}

resource "aws_vpc" "my_vpc"{
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.project}-vpc"
  }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.${count.index}.0/24"
  count = 2
  tags = {
    Name = "${local.project}-subnet-${count.index + 1}"
  }
}


# creating 4 EC2 instances
resource "aws_instance" "my_instance" {
  ami = "ami-020cba7c55df1f615"   # Replace with a valid AMI ID
  instance_type = "t2.micro"
  count = 4
  # subnet_id = aws_subnet.my_subnet[0].id
  subnet_id = element(aws_subnet.my_subnet[*].id, count.index)
  tags = {
    Name = "${localproject}- instance-${count.index + 1}"
  }
}