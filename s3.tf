resource "aws_s3_bucket" "dijolay" {
  bucket = "dijoteji_cicd_pipeline"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.dijolay.id
  acl    = "private"
}