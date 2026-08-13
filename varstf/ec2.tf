provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "demo_1"{
    ami_id = var.ami
    instance_type = var.inst_type
    vpc_security_group_ids = ["var.sg"]
    key_name = "var.key"
    tags = {
        Name = "tfvars-demo"
        purpose = "demo"
    }
}