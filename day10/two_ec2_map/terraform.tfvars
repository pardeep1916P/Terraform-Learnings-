#instances configuration map values
ec2_map_config = {
  "amazon-linux" = {
    ami           = "ami-0b967c22fe917319b" #amazon linux 2
    instance_type = "t2.micro"
  },
  "ubuntu" = {
    ami           = "ami-00271c85bf8a52b84" #ubuntu
    instance_type = "t2.micro"
  }
}
