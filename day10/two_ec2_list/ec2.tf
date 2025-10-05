#create 2 ec2 instance using list(object)
resource "aws_instance" "my_ec2" {
  depends_on    = [aws_subnet.subnet]
  count         = length(var.ec2_list_config)
  ami           = var.ec2_list_config[count.index].ami
  instance_type = var.ec2_list_config[count.index].instance_type
  subnet_id     = element(aws_subnet.subnet[*].id, count.index % length(aws_subnet.subnet))
  tags = {
    Name =  "tf-ec2-0${count.index + 1}"
  }
}

