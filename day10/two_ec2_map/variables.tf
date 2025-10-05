variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-west-1" # N.california
}

#instances configuration map variable
variable "ec2_map_config" {
  description = "two ec2 instances configurations in map of objects"
  type = map(object({
    ami           = string
    instance_type = string
  }))
}
