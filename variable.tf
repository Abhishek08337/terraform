variable "ami" {
    default = "ami-01a00762f46d584a1"
}

variable "inst_type" {
    default = "t3.micro" 
}

variable "key" {
    default = "abhi"
} 

variable "sg" {
    default = "sg-024292232aaa78a50"
}

variable "count" {   #note this count will not work when using data and output's beacuse it will restrict the number of instances created using the resource block.
    default = 1
}

variable "termination_protection" {
    default = false
}