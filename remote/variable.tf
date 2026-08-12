variable "ami_id" {
    default = "ami-01a00762f46d584a1"
}

variable "instance" {
    default = "t3.micro"
}

variable "sg" {
    default = "sg-094d08737a2b6ee88"
}

variable "key" {
    default = "abhi"
}
variable "term_protection" {
    default = false
}

variable "public_ip" {
    default = true
}