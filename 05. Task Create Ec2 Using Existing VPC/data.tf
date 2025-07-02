# Fetch the existing VPC (replace "your-vpc-name" with actual VPC name/tag)

data "aws_vpc" "existing_vpc" {
    filter {
        name  = "tag:Name"
        values = ["your-vpc-name"]  # Replace with your VPC name or tag
    }  
}

# Fetch public subnets in the VPC (needed for EC2 placement)

data "aws_subnets" "public_subnets" {
    filter {
      name = "vpc-id"
      values= [data.aws_vpc.existing_vpc.id]
    }

    filter {
      name = Name
      values = ["public-subnet-*"]  # Adjust the tag to match your public subnets
    }
}

# Fetch a default security group from the VPC (optional)

data "aws_security_group" "default_sg" {
    name = "default" # Replace if using a custom SG
    vpc_id = data.aws_vpc.existing_vpc.id
}
  
