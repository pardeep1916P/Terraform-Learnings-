terraform {
    required_providers {
        aws={
            source = "hashicorp/aws"
            version = "6.14.1"
        }
        random = {
            source = "hashicorp/random"
            version = "3.7.2"
        }
    }
    backend "s3"{
        bucket = "chinnu-aws-s3-demo"
        key = "terraform/state_files/s3.tfstate"
        region = "ap-south-2"
    }
}

provider "aws"{
    region = var.region
}

resource "aws_s3_bucket" "tf_s3_bucket" {
    bucket = "tf-s3-bucket-${random_id.rid.hex}"
    tags = {
        Name = "My tf bucket ${random_id.rid.hex}"
    }
}
resource "aws_s3_object" "file-upload"{
    bucket = aws_s3_bucket.tf_s3_bucket.bucket
    source ="./file.txt"
    key = "tf/demo.txt"
}

resource "random_id" "rid" {
    byte_length = 8
}