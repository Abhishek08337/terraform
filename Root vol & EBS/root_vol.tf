provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "root_vol" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.key
    vpc_security_group_ids = [var.sg]
    tags = {
        Name = "vol_demo"
        purpose = "demo"
    }

    root_block_device {
        volume_size = 14
        volume_type = "gp3"
        delete_on_termination = true
        encrypted = true
    }

}