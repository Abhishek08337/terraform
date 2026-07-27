provider "aws" {
    region = "ap-south-1"
    access_key = ""
    secret_key = ""
}

resource "aws instance" "webserver" {
    ami = "ami-01a00762f46d584a1"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-024292232aaa78a50"]
    key_name = "abhi"
    tags = {
        purpose = "webserver"
    }
    count = 2
}