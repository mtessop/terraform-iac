terraform {
  backend "s3" {
    bucket         = "my-terraform-storage-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
