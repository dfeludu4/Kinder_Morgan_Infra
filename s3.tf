resource "aws_s3_bucket" "b" {

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_1" {
  bucket = aws_s3_bucket.bucket_good_1.id

  block_public_acls   = true
  block_public_policy = true
}