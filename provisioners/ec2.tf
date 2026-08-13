provider "aws" {
    region = "ap-south-1"
    profile = "configs"
}

resource "aws_instance" "demo_ec2" {
    ami = var.ami
    instance_type = var.instance
    key_name = var.key
    vpc_security_group_ids = [var.sg]
    tags = {
        Name = "demo"
        purpose = "ec2-demo"
    }


    provisioner "file" {
        source = "sample.txt"
        destination = "/home/ec2-user/aws/"
    }

    provisioner "local-exec" {
        command = "echo ${self.private_ip} >> private_ip.txt"
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("${path.module}/tf.pem")
        host = self.public_ip
    }
    provisioner "remote-exec" {
        inline = [
            "sudo yum install httpd -y",
            "sudo systemctl start httpd",
            "sudo yum update all -y",
            "sudo yum upgrade",
            "sudo systemctl enable httpd"
        ]
    }


}