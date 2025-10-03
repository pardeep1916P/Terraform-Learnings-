#create a vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf_vpc"
  }
}

# Create a subnet01
resource "aws_subnet" "subnet01" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "tf_subnet_01"
  }
}

# Create a subnet02
resource "aws_subnet" "subnet02" {
  vpc_id     = aws_vpc.my-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "tf_subnet_02"
  }
}

