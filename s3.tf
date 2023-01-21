terraform {
  backend "s3" {
    bucket = "acorriero-bucket-8393"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}