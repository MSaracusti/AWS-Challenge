resource "aws_iam_role" "ec2_logs" {
  name = "ec2-logs-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "logs_write_policy" {
  name        = "logs-write-policy"
  description = "Allow EC2 to write to Logs bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:PutObject"],
      Resource = "arn:aws:s3:::logs/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_logs_attach" {
  role       = aws_iam_role.ec2_logs.name
  policy_arn = aws_iam_policy.logs_write_policy.arn
}

resource "aws_iam_instance_profile" "ec2_logs" {
  name = "ec2-logs-profile"
  role = aws_iam_role.ec2_logs.name
}

resource "aws_iam_role" "asg_images" {
  name = "asg-images-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = { Service = "ec2.amazonaws.com" },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "images_read_policy" {
  name        = "images-read-policy"
  description = "Allow ASG instances to read from Images bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect   = "Allow",
      Action   = ["s3:GetObject"],
      Resource = "arn:aws:s3:::images/*"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "asg_images_attach" {
  role       = aws_iam_role.asg_images.name
  policy_arn = aws_iam_policy.images_read_policy.arn
}

resource "aws_iam_instance_profile" "asg_images" {
  name = "asg-images-profile"
  role = aws_iam_role.asg_images.name
}
