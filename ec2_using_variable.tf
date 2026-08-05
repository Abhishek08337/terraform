provider "aws" {
    region = "ap-south-1"
    profile = "configs"  
}

resource "aws_instance" "webserver" {
    ami = var.ami
    instance_type = var.inst_type
    count = var.count
    key_name = var.key
    disable_api_termination = var.termination_protection
    vpc_security_group_ids = [var.sg,aws_security_group.webserver_sg.id]
    tags = {
        Name = "variable-demo"
        purpose = "demo"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install apache2 -y
                systemctl start apache2
                systemctl enable apache2
                echo "<h1>Hey It's ME</h1>" >>/var/www/html/index.html
                EOF                    
}

resource "aws_security_group" "webserver_sg" {
    name = "demo-sg"
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}