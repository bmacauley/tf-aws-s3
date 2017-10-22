//
// Module: tf-aws-s3
//
//  Variables
//

# aws_s3_bucket - terraform docs
# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html




# Required
# --------

variable "aws_region" {
  default = "eu-west-1"
}


# Optional
# --------


# The name of the bucket. If omitted, Terraform will assign a random, unique name.
variable "bucket" {
  default = "my-s3-bucket"
}


# If specified, the AWS region this bucket should reside in.
# Otherwise, the region used by the callee
variable "region" {
  default = "eu-west-1"
}


# bucket suffix
variable "bucket_suffix" {
  default = "suffix"
}

# enable random_id suffix
# eg my-bucket-de48g5
variable "random_id_suffix_enable" {
  default = 1
}

# Set canned ACL on bucket
# https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
variable "acl" {
  default = "private"
}


# Enable versioning on the bucket
variable "enable_versioning" {
  default = false
}


# A boolean that indicates all objects should be deleted from the
# bucket so that the bucket can be destroyed without error
variable "force_destroy" {
  default = false
}


# log bucket name, if bucket logging is enabled
variable "target_log_bucket" {
  default = ""
}

variable "target_log_bucket_prefix" {
  default = ""
}


# Set common tags on the bucket
variable "common_tags" {
  default = {
    created_by   = "terraform"
    project_id   = ""
    project_name = ""
    environment  = ""
    component    = ""
  }
}

variable "other_tags" {
  default = {}
}

#Terraform lifecycle rule to prevent the removal of a bucket during a destroy
variable "prevent_destroy" {
  default = false
}


