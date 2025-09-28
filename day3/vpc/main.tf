terraform {
    required_providers {
        aws={
            source = "hashicorp/aws"
            version = "6.14.1"
        }
        # random={
        #     source = "hashicorp/random"
        #     version = "3.5.1"
        # }
    }
    backend "s3" {
        bucket = "chinnu-aws-s3-demo"
        key = "terraform/state_files/vpc.tfstate"
        region = "ap-south-2"
    }
}

provider "aws" {
    region = var.region
}

#create vpc
resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "tf_vpc"
    }
}

#create public subnet
resource "aws_subnet" "public-subnet"{
     cidr_block = "10.0.1.0/24"
     vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "tf_public_subnet"
    }
}

#create private subnet
resource "aws_subnet" "private-subnet" {
    cidr_block  = "10.0.2.0/24"
    vpc_id = aws_vpc.my-vpc.id
    tags = {
        Name = "tf_private_subnet"
    }
}

#create Internet Gateway
resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.my-vpc.id
    tags = {
      Name = "tf_igw"
    } 
}

#routing table
resource "aws_route_table" "my-route" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-igw.id
    }
}

#associate route table with public subnet
resource "aws_route_table_association" "pub-subnet" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.my-route.id
}
