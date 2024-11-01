#New version copied
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }
   backend "s3" {
    bucket = "durga1-remote-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table = "81s-locking"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}