#creating four ec2 instances
resource "aws_instance" "main" {
  depends_on = [ aws_subnet.subnet ]
  ami           = var.ami_id
  instance_type = var.instance_type
  count         = var.instance_count
  subnet_id     = element(aws_subnet.subnet[*].id, count.index % length(aws_subnet.subnet))
  tags = {
    Name = "tf_ec2_instance_0${count.index + 1}"
  }
}
