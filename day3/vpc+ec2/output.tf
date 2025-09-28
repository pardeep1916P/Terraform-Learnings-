output "vpc_id" {
    value = aws_instance.private-ec2.private_ip
}