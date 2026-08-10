module "ec2"{
    source = "/home/abhi/tf/Module/Resource/EC2"
    ami_id = "ami-01a00762f46d584a1"
    inst_type = "t3.micro"
    instance_sg = "sg-024292232aaa78a50"
    key = "abhi"
    term_protection = false
    sub_id = module.vpc.subnet_id

}

module "vpc" {
    source = "/home/abhi/tf/Module/Resource/VPC"
    cidr = "10.0.0.0/16"
    subnet = "10.0.0.0/24"    
}