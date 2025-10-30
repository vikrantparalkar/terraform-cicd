terraform {
  backend "s3" {
    bucket = "my-s3-vikrant5757"
    key    = "state"
    region = "us-east-1"
    #use_lockfile = "mera-table"
    encrypt        = true
    #kms_key_id     = "THE_ID_OF_THE_KMS_KEY"
    dynamodb_table = "mera-table"
    
  }
}
