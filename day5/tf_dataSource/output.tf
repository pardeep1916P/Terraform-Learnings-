# output "sg_id"{
#     value = data.aws_security_group.default_sg.id
# }

output "vpc_id" {
  value = data.aws_vpc.my_vpc.id
}

output "subnet_ids" {
  value = data.aws_subnets.subnets.ids
}

output "public_subnet_id" {
  value = data.aws_subnet.public_sub.id
}

output "private_subnet_id" {
  value = data.aws_subnet.private_sub.id
}

output "ec2_active" {
  value = data.aws_instance.active.public_ip
}
