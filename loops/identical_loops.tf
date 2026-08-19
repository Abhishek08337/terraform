provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "demo_loop" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.key
    vpc_security_group_ids = [var.sg]
    count = 2    # It is used for identical loops only. Count is one of the types of loop 
}

