variable "bucket_name" {
  description = "Name of the s3 bucket. Must be unique."
  type        = string
}

variable "bucket_tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "table_name" {
  description = "Name of the dynamodb table"
  type        = string
}

variable "table_tags" {
  description = "Tags to set on the db table."
  type        = map(string)
  default     = {}
}
