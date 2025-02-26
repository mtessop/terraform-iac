data "aws_s3_bucket" "existing_bucket" {
  bucket = "my-terraform-storage-bucket"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-storage-bucket"
  
  # Only create if the bucket does not exist
  count = length(data.aws_s3_bucket.existing_bucket.id) > 0 ? 0 : 1

  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  count  = length(data.aws_s3_bucket.existing_bucket.id) > 0 ? 0 : 1

  versioning_configuration {
    status = "Enabled"
  }
}
