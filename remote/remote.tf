provider "aws" {
    region = "ap-south-1"
    profile = "default"  # use default from now on beacuse accidentally deleted configs profile
}

#PartitionKey = LockID
terraform {
    backend "s3" {
        bucket = "demo1-336457597463-ap-south-1-an"
        key = "terraform.tfstate"
        dynamodb_table = "demo-b44"
        region = "ap-south-1"
        profile = "default"   #same here
        shared_credentials_files = ["/home/abhi/.aws/credentials"]
    }
}


resource "aws_instance" "demo_instance" {
    ami = var.ami_id
    instance_type = var.instance
    key_name = "abhi"
    vpc_security_group_ids = [var.sg]
    disable_api_termination = var.term_protection
    associate_public_ip_address = var.public_ip
    tags = {
        Name = "Remote-Demo"
        purpose = "demo"
    }
    user_data = <<-EOF
                sudo apt update -y 
                sudo apt install apache2 -y
                systemctl start apache2 -y
                echo "<h1>Hey It's Me Abhi <h1>" >> /var/www/html/index.html 
                EOF
}       