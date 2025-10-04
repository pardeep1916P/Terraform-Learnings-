#get data source for subnet ids
data "aws_subnets" "subnets" {
  depends_on = [aws_subnet.subnet]
  filter {
    name   = "vpc-id"
    values = [aws_vpc.my-vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["tf_subnet_*"]
  }

}
