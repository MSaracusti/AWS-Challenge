output "ec2_logs_instance_profile" {
  value = aws_iam_instance_profile.ec2_logs.name
}

output "asg_images_instance_profile" {
  value = aws_iam_instance_profile.asg_images.name
}
