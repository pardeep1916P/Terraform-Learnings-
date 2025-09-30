data "aws_instance" "running_instance" {
    tags = {
        Name = "image-label-backend"
        value = "tf_dataSource_demo"
    }
    filter {
        name   = "instance-state-name"
        values = ["running"]
    }
}