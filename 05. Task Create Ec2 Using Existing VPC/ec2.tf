# Create an EC2 instance inside the existing VPC

resource "aws_instance" "my-ec2" {
    ami = "ami-0c55b159cbfafe1f0"  # Replace with your desired AMI ID
    instance_type = "t2.micro"  # Adjust as needed
    subnet_id = data.aws_subnets.public_subnets.ids[0]  # Use the first public subnet   
    vpc_security_group_ids = [data.aws_security_group.default_sg.id]

    tags = {
      Name = "MyEC2Instance"  # Name tag for the instance
    }
}