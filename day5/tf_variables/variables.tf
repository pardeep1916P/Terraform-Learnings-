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
    default = "t3.micro"
    validation {
        condition     = contains(["t2.micro", "t3.micro", "t3a.micro"], var.instance_type)
        error_message = "instance_type must be one of t2.micro, t3.micro, t3a.micro"
    }
}

variable "block_device_config" {
    description = "volume_size,volume_type,delete_on_termination"
    type = object({
        volume_size = number
        volume_type = string
        delete_on_termination= bool
    })
    default = {
        volume_size = 20
        volume_type = "gp3"
        delete_on_termination = false
    }
    validation {
        condition     = var.block_device_config.volume_size >= 8 && var.block_device_config.volume_size <= 16384 && contains(["gp2", "gp3", "io1", "io2", "sc1", "st1", "standard"], var.block_device_config.volume_type)
        error_message = "volume_size must be between 8 and 16384, and volume_type must be one of gp2, gp3, io1, io2, sc1, st1, standard"
    }
}


