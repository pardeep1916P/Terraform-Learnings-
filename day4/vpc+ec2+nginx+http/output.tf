output "public_ip" {
    value = aws_instance.nginxServer.public_ip
}
output "access_url" {
    value = "http://${aws_instance.nginxServer.public_ip}"
}