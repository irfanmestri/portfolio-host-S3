terraform {
  backend "s3" {
    bucket = "my-portfolio-s3-terra"
    key    = "statefile/terraform.state"
    region = "us-west-1"
  }
}
