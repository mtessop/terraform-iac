resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-tf-bucket-${random_id.suffix.hex}"
  tags = { Name = "My S3 Bucket", Environment = "Dev" }
}

resource "random_id" "suffix" {
  byte_length = 4
}
