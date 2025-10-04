#subnet ids   
output "subnet_ids" {
  value = data.aws_subnets.subnets.ids
}

#instance ids
output "instance_ids" {
  value = aws_instance.main[*].id
}

# #instance public ips
# output "instance_public_ips" {
#   value = aws_instance.main[*].public_ip
# }

#instance subnets
output "instance_subnet_ids" {
  value = aws_instance.main[*].subnet_id
}
