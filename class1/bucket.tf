resource "aws_s3_bucket" "example" {
  bucket_prefix= "kaizen-"
  }

resource "aws_s3_bucket" "test" {
  bucket = "jonele"
  }