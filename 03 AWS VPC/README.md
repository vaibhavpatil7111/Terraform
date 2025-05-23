🌐 AWS VPC Setup Using Terraform
This project demonstrates how to create a Virtual Private Cloud (VPC) in AWS using Terraform. It includes the creation of a VPC, public and private subnets, an internet gateway, and a route table.

📁 Project Structure
bash
Copy
Edit
.
├── main.tf         # Terraform provider requirements
├── provider.tf     # AWS provider configuration
├── vpc.tf          # Resources: VPC, subnets, internet gateway, and route table
✅ Prerequisites
Terraform installed

An AWS account

AWS credentials configured (using environment variables, AWS CLI, or ~/.aws/credentials file)

🔧 Step-by-Step Explanation
1. main.tf – Terraform Initialization
hcl
Copy
Edit
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}
This file specifies that we're using the AWS provider version 6.0.0-beta2. Terraform uses this block to initialize required plugins.

2. provider.tf – AWS Region Configuration
hcl
Copy
Edit
provider "aws" {
  region = "us-west-1"
}
We define the AWS region where resources will be created. In this example, the region is us-west-1.

3. vpc.tf – VPC and Network Components
🔹 VPC Creation
hcl
Copy
Edit
resource "aws_vpc" "My_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My_VPC"
  }
}
We create a Virtual Private Cloud (VPC) with a CIDR block of 10.0.0.0/16, allowing up to 65,536 IP addresses.

🔹 Subnets
h
Copy
Edit
resource "aws_subnet" "Private_Subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.My_VPC.id
  tags = {
    Name = "Private_Subnet"
  }
}

resource "aws_subnet" "Public_Subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.My_VPC.id
  tags = {
    Name = "Public Subnet"
  }
}
Private Subnet: Used for instances not requiring internet access.

Public Subnet: Used for instances that need to connect to the internet.

🔹 Internet Gateway
hcl
Copy
Edit
resource "aws_internet_gateway" "My_Internet_Gateway" {
  vpc_id = aws_vpc.My_VPC.id
  tags = {
    Name = "My_Internet_Gateway"
  }
}
Enables internet access for resources in the public subnet.

🔹 Route Table
hcl
Copy
Edit
resource "aws_route_table" "My_Route_table" {
  vpc_id = aws_vpc.My_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My_Internet_Gateway.id
  }
}
Creates a route for outbound internet traffic (0.0.0.0/0) through the internet gateway.

🚀 How to Deploy
Initialize Terraform

bash
Copy
Edit
terraform init
Validate the configuration

bash
Copy
Edit
terraform validate
See the execution plan

bash
Copy
Edit
terraform plan
Apply the configuration

bash
Copy
Edit
terraform apply
Destroy the infrastructure (if needed)

bash
Copy
Edit
terraform destroy
📌 Notes
This is a basic VPC setup for learning purposes.

You can expand this by adding NAT Gateways, Security Groups, EC2 instances, etc.

Be cautious of costs—resources in AWS may incur charges.

🙌 Contributing
Feel free to fork the repo, suggest improvements, or open issues if you find any problems.
