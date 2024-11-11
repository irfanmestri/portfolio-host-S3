terraform {
  backend "s3" {
    bucket = var.bucketname
    key    = "statefile/terraform.state"
    region = "us-east-1"
  }
}
