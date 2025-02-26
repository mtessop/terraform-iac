# Check if the bucket already exists
data "aws_s3_bucket" "existing" {
  bucket = "my-terraform-storage-bucket"
}

# Create the bucket only if it does not exist
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-storage-bucket"
  count  = length(data.aws_s3_bucket.existing.id) > 0 ? 0 : 1

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "MyTerraformS3Bucket"
    Environment = "Dev"
  }
}
