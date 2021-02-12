# Build S3 to store TF state
resource "aws_s3_bucket" "tf-state-bucket" {
 bucket = var.bucket_name
 server_side_encryption_configuration {
   rule {
     apply_server_side_encryption_by_default {
       sse_algorithm = "AES256"
     }
   }
 }
 lifecycle {
   prevent_destroy = true
 }
 versioning {
   enabled = true
 }
 tags = var.bucket_tags
}
# Build DynamoDB to lock TF state
resource "aws_dynamodb_table" "tf-lock-state-table" {
 name = var.table_name
 billing_mode = "PAY_PER_REQUEST"
 hash_key = "LockID"
 attribute {
   name = "LockID"
   type = "S"
 }
 tags = var.table_tags
}
