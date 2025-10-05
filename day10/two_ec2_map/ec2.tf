#create 2 ec2 instance using map(object)
resource "aws_instance" "my_ec2" {
  depends_on    = [aws_subnet.subnet]
  for_each      = var.ec2_map_config
  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = element(aws_subnet.subnet[*].id, index(keys(var.ec2_map_config), each.key) % length(aws_subnet.subnet))
  tags = {
    Name = "tf-ec2-${each.key}"
  }
}
