terraform {
  backend "s3" {
    bucket = "my-bucket-terra-jen-infra"
    key    = "statefile/terraform.state"
    region = "us-east-1"
  }
}
