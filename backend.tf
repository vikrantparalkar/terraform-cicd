terraform {
  backend "s3" {
    bucket = "my-s3-vikrant5757"
    key    = "terraform/state"
    region = "us-east-1"
    use_lockfile = true
    encrypt      = true 
  }
}
