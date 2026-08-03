provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "webserver"{
    ami = ""
    instance_type = "t3.micro"
    count = 1
    vpc_security_group_ids = ["<enter security group id>,aws_security_group.webserver_sg.id"]
    key_name = "abhi"
    user_data = <<-EOF
                #!/bin/bash
                sudo apt install nginx
                systemctl start nginx 
                sudo echo "<h1>Hey this is made by me </h1>" >>> /var/www/html/index.html
                EOF
    tags = {
        Name = "Security-group-demo"
        purpose = "demo"
    }
}

resource "aws_security_group" "webserver_sg" {
    name = "tf-sg"
    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}