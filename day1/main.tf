terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.14.1"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}
resource "aws_instance" "tf-ec2-1" {
    count = 2
    ami = "ami-02d26659fd82cf299"
    instance_type =  "t2.micro"
    tags = {
        Name = "Terraform-EC2-Instance-1"
    }
}