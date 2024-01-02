output "instance-ID" {
  value = aws_instance.myec2.id
}

output "public-ip" {
  value = aws_instance.myec2.public_ip
}