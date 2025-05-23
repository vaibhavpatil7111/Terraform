# Gentraing the s3 bucket uqnie name 

resource "random_id" "random_id" {
    byte_length = 4
  
}