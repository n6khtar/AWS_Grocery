output "ec2_public_ip" {
  value = aws_instance.app_server.public_ip
}

output "rds_endpoint" {
  value = aws_db_instance.postgres.endpoint
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_storage.bucket
}

output "lambda_function_url" {
  description = "The public URL for the Discount Lambda"
  value       = aws_lambda_function_url.lambda_url.function_url
}
