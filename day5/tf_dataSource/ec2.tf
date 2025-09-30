# resource "aws_instance" "ec2_in_existinVpc" {
#   ami                         = "ami-0cf8ec67f4b13b491"
#   instance_type               = "t3.micro"
#   vpc_security_group_ids      = [data.aws_security_group.default_sg.id]
#   associate_public_ip_address = true
#   subnet_id                   = data.aws_subnet.private_sub.id
#   tags = {
#     Name = "ec2_in_existinVpc"

#   }
# }
