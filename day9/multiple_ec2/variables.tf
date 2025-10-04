variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-1" # N.california
}

#variable for ami id
variable "ami_id" {
  description = "ami id for ec2 instance"
  type        = string
  default     = "ami-00271c85bf8a52b84"
}

#variable for instance type
variable "instance_type" {
  description = "instance type for ec2 instance"
  type        = string
  default     = "t2.micro"
}

#no of instances 
variable "instance_count" {
  description = "number of ec2 instances"
  type        = number
  default     = 4
}
