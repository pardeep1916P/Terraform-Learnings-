variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-1" # N.california
}

#instances configuration variable
variable "ec2_list_config" {
  description = "two ec2 instances configurations in list of objects"
  type = list(object({
    ami           = string
    instance_type = string
  }))
}
