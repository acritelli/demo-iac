terraform {
  backend "s3" {
    bucket = "acritelli"
    key    = "terraform-demo/"
    region = "us-east-1"
  }
}
