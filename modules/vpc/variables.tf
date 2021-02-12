variable "vpc_cidr_block" {
  description = "VPC CIDR BLOCK"
  type        = string
}
variable "vpc_tags" {
  description = "Tags to set on the VPC."
  type        = map(string)
  default     = {}
}
