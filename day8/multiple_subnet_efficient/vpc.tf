#create a vpc
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "tf_vpc"
  }
}

#create two subnets with one block
resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.my-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  count =2
  tags = {
    Name = "tf_subnet_0${count.index+1}"
  }
}