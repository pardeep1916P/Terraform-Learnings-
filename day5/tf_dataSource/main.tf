terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.14.1"
    }
  }
  backend "s3" {
    bucket = "chinnu-aws-s3-demo"
    key    = "terraform/state_files/ec2_in_existinVpc.tfstate"
    region = "ap-south-2"
  }
}

provider "aws" {
  region = var.region
}


