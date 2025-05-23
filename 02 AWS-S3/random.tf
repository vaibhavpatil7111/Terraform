#creating the random id for the s3 mane

resource "random_id" "s3-random_id" {
    byte_length = 4
  
}