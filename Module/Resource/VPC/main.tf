resource "aws_vpc" "vpc_1"{
    cidr_block = var.cidr

}

resource "aws_subnet" "subnet_1"{
    vpc_id = aws_vpc.vpc_1.id
    cidr_block = var.subnet

}