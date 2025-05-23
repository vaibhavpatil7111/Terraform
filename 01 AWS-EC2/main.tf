
resource "aws_instance" "terraformPratice" {
    ami = "ami-07706bb32254a7fe5"
    instance_type = "t2.micro"
  

tags = {
    Name = "SampleServeis"
}
}