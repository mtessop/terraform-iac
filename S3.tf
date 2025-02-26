data "aws_s3_bucket" "existing" {
  bucket = "my-terraform-storage-bucket"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-storage-bucket"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name        = "MyTerraformS3Bucket"
    Environment = "Dev"
  }
}
