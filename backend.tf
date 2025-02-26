terraform {
  backend "s3" {
    bucket         = "my-cloudformation-s3-bucket-new-504074744946"  # Use a bucket that exists
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
  }
}
