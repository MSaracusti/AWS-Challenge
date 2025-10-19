# modules/asg/main.tf
resource "aws_launch_template" "web" {
  name_prefix   = "web-template"
  image_id      = var.redhat_ami
  instance_type = "t2.micro"

  user_data = base64encode(<<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
  EOF
  )

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 20
    }
  }

  iam_instance_profile {
    name = var.iam_instance_profile
  }
}

resource "aws_autoscaling_group" "web_asg" {
  desired_capacity     = 2
  max_size             = 6
  min_size             = 2
  vpc_zone_identifier  = var.private_subnet_ids
  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Web-ASG"
    propagate_at_launch = true
  }
}
