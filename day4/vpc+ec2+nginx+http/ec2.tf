resource "aws_instance" "nginxServer" {
  ami                         = "ami-0bd4cda58efa33d23"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.nginx_sg.id]
  associate_public_ip_address = true
  user_data                   = <<-EOF
                          #!/bin/bash
                          sudo apt update -y
                          sudo apt install nginx -y
                          sudo systemctl start nginx
                          sudo systemctl enable nginx
                          sudo ufw disable
                      EOF
  tags = {
    Name = "NginxServer"
  }
}
