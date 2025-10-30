terraform {
  backend "s3" {
    bucket = "my-s3-vikrant5757"
    key    = "state"
    region = "us-east-1"
    use_lockfile = "mera-table"
    encrypt        = true
  }
}
