resource "aws_instance" "my_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = true 
  root_block_device {
    volume_size           = var.block_device_config.volume_size
    volume_type           = var.block_device_config.volume_type 
    delete_on_termination = var.block_device_config.delete_on_termination
  }
  tags = {
    Name = "my_ec2"
  }
}
