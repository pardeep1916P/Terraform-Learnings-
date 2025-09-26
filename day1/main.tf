terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}

provider "aws" {
    region = var.region
}
resource "aws_instance" "tf-ec2-1" {
    ami = "ami-0bd4cda58efa33d23"
    instance_type =  "t3.micro"
    tags = {
        Name = "Terraform-EC2-Instance-1"
    }
}