output "subnets_created" {
    value = [aws_subnet.subnet01.id, aws_subnet.subnet02.id]
}