# Write only resource file in the main 
# We did this to seperate and improve understanding of the scripts 


resource "aws_instance" "demo_instance" {
    ami = var.ami_id
    instance_type = var.inst_type
    vpc_security_group_ids = [var.instance_sg]
    user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install nginx -y
                systemctl start nginx
                EOF
    tags {
        Name = "nginx-demo"
        purpose = "demo"
    }
}

resource "aws_security_group" "sg_1" {
    name = "demo-sg"
    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        description = "ALL-TCP"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks =["0.0.0.0/0"]
    }
}
