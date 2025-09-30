variable "region" {
  default = "ap-south-1"
}

variable "ami" {
    description = "which AMI do you want to use?"
    type        = string
    default     = "ami-02d26659fd82cf299"
}

variable "instance_type" {
    description = "which type of instance do you want?"
    type        = string
}


