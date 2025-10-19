output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "asg_name" {
  value = module.asg.asg_name
}

output "images_bucket" {
  value = module.s3.images_bucket_name
}

output "logs_bucket" {
  value = module.s3.logs_bucket_name
}

