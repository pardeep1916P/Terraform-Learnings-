data "aws_security_group" "default_sg" {
  tags = {
    name = "default"
  }
}

data "aws_vpc" "my_vpc" {
  tags = {
    Name = "tf_vpc"
  }
}

data "aws_subnets" "subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.my_vpc.id]
  }
}

data "aws_subnet" "public_sub" {
  tags = {
    Name = "tf_public_subnet"
  }
}

data "aws_subnet" "private_sub" {
  tags = {
    Name = "tf_private_subnet"
  }
}

data "aws_instance" "active" {
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}
