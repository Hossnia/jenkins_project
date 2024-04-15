terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.61.0"
    }
  }


  backend "s3" {
    bucket = "week10-terraform"
    key = "041524/terraform.tfstate"
    region = "us-east-1"
    #Put down here the name of your DynamoDB table
    dynamodb_table = "state-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}