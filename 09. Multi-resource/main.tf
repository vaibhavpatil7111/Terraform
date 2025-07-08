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