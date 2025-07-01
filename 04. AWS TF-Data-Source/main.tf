
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0-beta1"
    }

  }
}

# Region Selected Of the Ec2

provider "aws" {
  region = "us-west-1"
}

data "aws_ami" "name" {
    most_recent = true
    owners = ["amazon"]

  
}


# Setting the Ec2 Setup

resource "aws_instance" "Myserver" {
    ami = "ami-05ffe3c48a9991133"
    instance_type = "t2.micro"
    tags = {
        Name = "Myserver"
    }
  
}