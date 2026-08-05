variable "ami" {
    default = "ami-01a00762f46d584a1"
}

variable "instance_type" {
    default = "t3.micro" 
}

variable "key" {
    default = "abhi"
} 

variable "security_group" {
    default = "sg-024292232aaa78a50"
}

variable "count" {
    default = 1
}

variable "termination_protection" {
    default = false
}