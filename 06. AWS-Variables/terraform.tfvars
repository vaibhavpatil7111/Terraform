vpc_cidr_block     = "10.0.0.0/16"
subnet_cidr_block  = "10.0.1.0/24"
availability_zone  = "us-east-1a"
instance_type      = "t2.micro"
ami_id             = "ami-0c55b159cbfafe1f0"
key_name           = "my-keypair"
ec2_user_data      = "${file("ec2_config.sh")}"

ec2_config = {
  v_size = 30
  v_type = "gp3"
}

additional_tags = {
  Environment = "Dev"
  Owner       = "Vaibhav"
}
