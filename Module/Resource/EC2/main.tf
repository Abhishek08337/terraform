# Write only resource file in the main 
# We did this to seperate and improve understanding of the scripts 


resource "aws_instance" "demo_instance" {
    ami = var.ami_id
    instance_type = var.inst_type
    vpc_security_group_ids = [var.instance_sg]
    subnet_id = var.sub_id
    user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update -y
                sudo apt-get install nginx -y
                systemctl start nginx
                EOF
    tags = {
        Name = "nginx-demo"
        purpose = "demo"
    }
}

