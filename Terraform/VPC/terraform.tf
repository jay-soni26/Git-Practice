terraform {
  backend "s3" {
    bucket = "terraform-dependency"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}