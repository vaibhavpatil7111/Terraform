# creating the s3 bucket
resource "aws_s3_bucket" "aws_s3_webapp" {
    bucket = "${var.aws_s3_bucket_webapp}-${random_id.random_id.hex}-static"
}

# S3 Bucket Public Access Block 

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.aws_s3_webapp.id

  block_public_policy     = false
  block_public_acls       = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Adding the Policy for S3 Buckect

resource "aws_s3_bucket_policy" "webapp" {
  bucket = aws_s3_bucket.aws_s3_webapp.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "arn:aws:s3:::${aws_s3_bucket.aws_s3_webapp.id}/*"
      }
    ]
  })
}



# Adding Website Configuration
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.aws_s3_webapp.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

# right now we dont need
#   routing_rule {
#     condition {
#       key_prefix_equals = "docs/"
#     }
#     redirect {
#       replace_key_prefix_with = "documents/"
#     }
#   }
}

# Uploading the file index_html and style.css
resource "aws_s3_object" "index_html" {
    bucket = aws_s3_bucket.aws_s3_webapp.bucket
    key = "index.html"
    source = "./index.html"
    content_type =  "text/html" 
}

resource "aws_s3_object" "style_css"{
    bucket = aws_s3_bucket.aws_s3_webapp.bucket
    key = "style.css"
    source = "./style.css"
    content_type = "text/css"
}

