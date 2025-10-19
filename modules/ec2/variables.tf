variable "subnet_id" {
  description = "Subnet ID for EC2 instance"
  type        = string
}

variable "redhat_ami" {
  description = "AMI ID for Red Hat Linux"
#  default = "ami-0f2b4fc905b0bdc6c"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}
