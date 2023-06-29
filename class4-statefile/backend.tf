terraform {
  backend "s3" {
    bucket = "salamkandai"
    key    = "kaizen/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "lock-state"
  }
}