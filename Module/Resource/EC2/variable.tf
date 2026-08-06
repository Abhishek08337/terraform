variable "ami_id"{
    default = "ami-01a00762f46d584a1"
}

variable "inst_type" {
    default = "t3.micro"
}

variable "instance_sg" {
    default = "sg-024292232aaa78a50"
}

variable "key" {
    default = "abhi"
}

variable "term_protection" {
    default = false
}
