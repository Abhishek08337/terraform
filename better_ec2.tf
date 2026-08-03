provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "webserver"  {
    # core configuration
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    count = 1

    # Network & Security 
    vpc_security_group_ids = ["sg-0e26e829ff0d4f034"]
    key_name = "abhi"

    #Storage configuration(root block)
    ebs_block_device {
        device_name = "/dev/sdb"
        volume_type = "gp3"
        volume_size = 10
        encrypted = true
        delete_on_termination = true
    }
    
    tags = {
        Name = "ec2-iaac-demo"
        purpose = "demo"
    }

}
