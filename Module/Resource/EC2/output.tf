output "instance_ip" {
    value = aws_instance.demo_instance.public_ip
}

output "dns" {
    value = aws_instance.demo_instance.public_dns
}
