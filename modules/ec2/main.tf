# modules/ec2/main.tf
resource "aws_instance" "redhat" {
  ami           = var.redhat_ami
  instance_type = "t2.micro"
  subnet_id     = var.subnet_id
  iam_instance_profile = var.iam_instance_profile

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "RedHat-Instance"
  }
}
