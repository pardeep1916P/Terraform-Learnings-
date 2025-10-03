output "subnets" {
    value = [data.aws_subnet.subnets.ids]
}
