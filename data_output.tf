provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "demo" {
    ami = var.ami
    instance_type = var.inst_type
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.demo_sg.id,data.aws_security_group.sginfo.id]
    user_data = <<-EOF
                #!/bin/bash
                sudo - i
                sudo apt install apache2 -y
                systemctl start apache2
                echo "<h1>HEY it's me</h1>" >>/var/www/html/index.html
                EOF
    tags = {
        Name = "demo-inst"
        purpose = "demo"
    }
}

resource "aws_security_group" "demo_sg" {
    name = "sg_demo"

    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "all"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

data "aws_security_group" "sginfo" {
    name = "default"
}

output "instanceip" {
    value = aws_instance.demo.public_ip
}

output "dns" {
    value = aws_instance.demo.public_dns
}