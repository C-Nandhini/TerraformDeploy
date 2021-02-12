terraform {
 required_version = ">=0.14.5"
 backend "s3" {
   bucket = "tf-state-file-bucket"
   key = "terraform.tfstate"
   region = "us-east-1"
   dynamodb_table = "tf-state-locks"
   encrypt = true
 }
}
provider "aws" {
 region = "us-east-1"
}

module "remote-state" {
  source = "./modules/remote-state"
  bucket_name = "tf-state-file-bucket"
  bucket_tags = {
    Terraform   = "true"
    Environment = "dev"
  }
  table_name = "tf-state-locks"
  table_tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr_block = "192.168.0.0/24"
  vpc_tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
