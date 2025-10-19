variable "private_subnet_ids" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "redhat_ami" {
  description = "AMI ID for Red Hat Linux"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}
