output "public_ip"{
    value = aws_instance.my_instance.public_ip
}

output "running_instance_ip"{
    value = data.aws_instance.running_instance.public_ip
}