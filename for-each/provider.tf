terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "s3" {
    bucket         	   = "kdp-remote-state"
    key              	   = "remote-state-foreach"
    region         	   = "us-east-1"
    dynamodb_table = "tf-nov-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}