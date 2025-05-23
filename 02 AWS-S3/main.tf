#created the s3 bucket

resource "aws_s3_bucket" "s3bucket" {
    bucket ="${var.s3bucket}-${random_id.s3-random_id.hex}-website-static"
  
}



#create the upload data file

resource "aws_s3_object" "bucket-data" {
    bucket = aws_s3_bucket.s3bucket.bucket
    source = "./myfile.txt"
    key = "mydata.txt"
  
}