data "aws_subnet" "subnets" {
    filter {
        name   = "vpc-id"
        values = [aws_vpc.my-vpc.id]
    }
    filter {
        name   = "tag:Name"
        values = ["tf_subnet_*"]
    }

}