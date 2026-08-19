provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "loop_2" {
    for_each = toset(var.ami_id)  # this will create unidentical loops just make sure to use toset 
    # toset will convert list to set which is important because the for each will not work with the list data type
    ami = each.value
    instance_type = var.instance
    vpc_security_group_ids = [var.sg,aews_security_group.demo_sg.id]
    key_name = var.key
}

resource "aws_security_group" "demo_sg" {
    depends_on = [aws_instance.loop_2]  # the depends on here will decide what will be build first means here first instance will created thenn other things will get created
        # basically it decides the order of build/creating of resources
    name = "project-sg"
    ingress {
        description = "ssh"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "http"
        from_port = 80
        to_port = 80
        protocol = "tcp" 
        cidr_blocks =["0.0.0.0/0"]
    }
    egress {
        description = "all-tcp"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}


variable "ami_id" {
    default = ["ami-0ac7b260cf76d8865","ami-01a00762f46d584a1","ami-0bab3e522d0116a53"]
}

output "ip" {
    value = values(aws_instance.loop_2)[*].public_ip
}