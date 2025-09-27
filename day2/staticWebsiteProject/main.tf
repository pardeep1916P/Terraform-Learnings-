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
        key = "terraform/state_files/staticSite.tfstate"
        region = "ap-south-2"
    }
}

provider "aws"{
    region = var.region
}

resource "aws_s3_bucket" "webapp-bucket" {
    bucket = "webapp-bucket-${random_id.rid.hex}"
    tags = {
        Name = "My tf bucket ${random_id.rid.hex} for static site"
    }
}


resource "aws_s3_bucket_public_access_block" "webapp-bucket" {
  bucket = aws_s3_bucket.webapp-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


resource "aws_s3_bucket_policy" "public-access" {
    bucket = aws_s3_bucket.webapp-bucket.id
    policy = jsonencode(
        {
            Version = "2012-10-17",
            Statement = [
                {
                    Sid = "Statement1",
                    Effect = "Allow",
                    Principal = "*",
                    Action = "s3:GetObject",
                    Resource = "arn:aws:s3:::${aws_s3_bucket.webapp-bucket.bucket}/*"
                }
            ]
        }
    )
    depends_on = [aws_s3_bucket_public_access_block.webapp-bucket]
}

resource "aws_s3_bucket_website_configuration" "webapp-bucket" {
  bucket = aws_s3_bucket.webapp-bucket.id

  index_document {
    suffix = "index.html"
  }

}

resource "aws_s3_object" "image-upload"{
    bucket = aws_s3_bucket.webapp-bucket.bucket
    source ="./site/photo.png"
    key = "photo.png"
}

resource "aws_s3_object" "file-upload"{
    bucket = aws_s3_bucket.webapp-bucket.bucket
    source ="./site/index.html"
    key = "index.html"
    content_type= "text/html"
}

resource "random_id" "rid" {
    byte_length = 8
}