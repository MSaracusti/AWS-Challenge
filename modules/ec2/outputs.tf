output "instance_id" {
  value = aws_instance.redhat.id
}

output "public_ip" {
  value = aws_instance.redhat.public_ip
}
