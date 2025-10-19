output "images_bucket_name" {
  value = aws_s3_bucket.images.bucket
}

output "logs_bucket_name" {
  value = aws_s3_bucket.logs.bucket
}
