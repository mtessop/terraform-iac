terraform {
  backend "s3" {
    bucket         = "my-terraform-storage-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
