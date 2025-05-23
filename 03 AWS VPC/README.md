# 🏗️ AWS VPC with Terraform

## _A Simple Terraform Project to Deploy a VPC with Public and Private Subnets_

[![Terraform](https://img.shields.io/badge/Terraform-v1.8.0-blueviolet)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange)](https://aws.amazon.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

This project sets up a basic **Virtual Private Cloud (VPC)** on AWS using **Terraform**. The VPC includes both **public and private subnets**, an **Internet Gateway**, and a **route table** for enabling internet access.

---

## ✨ Features

- Provision a custom VPC
- Create public and private subnets
- Attach an Internet Gateway
- Configure a route table for public access
- Modular and easy-to-understand structure

---

## 📁 Project Structure

.
├── main.tf # Terraform required providers
├── provider.tf # AWS region setup
├── vpc.tf # VPC, subnets, IGW, and route table definitions
└── README.md # Documentation

yaml
Copy
Edit

---

## 🛠️ Tech Stack

This project uses:

- [Terraform](https://www.terraform.io/) - Infrastructure as Code
- [AWS](https://aws.amazon.com/) - Cloud Provider

---

## 🚀 Getting Started

### ✅ Prerequisites

- [Terraform v1.8+](https://www.terraform.io/downloads.html)
- AWS Account
- AWS credentials configured using:
  - `aws configure` via AWS CLI, or
  - Environment variables, or
  - Shared credentials file

---

## 🧱 Infrastructure Breakdown

### 1️⃣ `main.tf` - Define Provider Requirements

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }
}
```
### 2️⃣ provider.tf - AWS Region Setup
```
provider "aws" {
  region = "us-west-1"
}
```
### #️⃣ vpc.tf - Define AWS Resources
```hcl
resource "aws_vpc" "My_VPC" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "My_VPC"
  }
}
```
### Private Subnet
```
resource "aws_subnet" "Private_Subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id     = aws_vpc.My_VPC.id
  tags = {
    Name = "Private_Subnet"
  }
}
```
### Public Subnet
```
resource "aws_subnet" "Public_Subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id     = aws_vpc.My_VPC.id
  tags = {
    Name = "Public_Subnet"
  }
}
```
### Internet Gateway
```
resource "aws_internet_gateway" "My_Internet_Gateway" {
  vpc_id = aws_vpc.My_VPC.id
  tags = {
    Name = "My_Internet_Gateway"
  }
}
```
### Route Table
```
resource "aws_route_table" "My_Route_table" {
  vpc_id = aws_vpc.My_VPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My_Internet_Gateway.id
  }

  tags = {
    Name = "My_Route_table"
  }
}
```
### 🧪 Usage Instructions
### Initialize Terraform
```terraform init```
### Validate the Configuration
``` terraform validate```
### Preview the Plan
``` terraform plan ```
### Apply the Changes
```terraform apply```
### (Optional) Destroy the Infrastructure
``` tearrform destroy```
### 🔌 Plugins & Integrations
Currently, this project does not use additional plugins.
You can extend it by integrating:

Integration :- 	Suggestion
NAT :- Gateway	For private subnet internet access
EC2 Instances :- For launching test servers
Route Table Assoc :- subnets with route tables

### 🧑 ‍💻 Development & Contribution
Want to contribute? Awesome!

Feel free to fork this repo and open a pull request with improvements, bug fixes, or enhancements.
