resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  root_block_device {
    volume_size           = 8
    volume_type           = "gp2"
    delete_on_termination = true
  }
  tags = {
    Name = "my_ec2"
  }
}
