output "instance_id_and_ip" {
    value={
        id=aws_instance.tf-ec2-1.id,
        public_ip=aws_instance.tf-ec2-1.public_ip
    }
  
}