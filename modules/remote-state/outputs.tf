output "bucket_arn" {
  value = aws_s3_bucket.tf-state-bucket.arn
}

output "table_arn" {
  value = aws_dynamodb_table.tf-lock-state-table.arn
}
