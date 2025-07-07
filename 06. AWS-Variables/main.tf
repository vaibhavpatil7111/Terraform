provider "aws" {
  region = var.region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = merge({
    Name = "my-vpc"
  }, var.additional_tags)
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone

  tags = merge({
    Name = "my-subnet"
  }, var.additional_tags)
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.main.id
  key_name      = var.key_name
  user_data     = var.ec2_user_data

  root_block_device {
    volume_size = var.ec2_config.v_size
    volume_type = var.ec2_config.v_type
  }

  tags = merge({
    Name = "my-ec2"
  }, var.additional_tags)
}
