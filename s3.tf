resource "aws_s3_bucket" "b" {

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}