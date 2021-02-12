output "s3_bucket_arn" {
  description = "Bucket ARN"
  value = module.remote-state.bucket_arn
}

output "dynamodb_table_arn" {
  description = "Table ARN"
  value = module.remote-state.table_arn
}
