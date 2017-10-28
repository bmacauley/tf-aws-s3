//
// Module: tf-aws-s3
//


provider "aws" {
  region = "${var.aws_region}"
}


# create a bucket
resource "aws_s3_bucket" "b" {
  bucket        = "${local.bucket}"
  region        = "${var.region}"
  force_destroy = "${var.force_destroy}"
  acl           = "private"

  versioning {
    enabled = "${var.enable_versioning}"
  }

  # logging {
  #   target_bucket = "${var.target_log_bucket}"
  #   target_prefix = "${var.target_log_bucket_prefix}"
  # }

  tags = "${local.tags}"

}

# data
data "template_file" "bucket-policy-aes256" {
  template = "${file("${path.module}/bucket_policies/bucket-policy-aes256.tpl")}"
  vars {
    bucket_name = "${aws_s3_bucket.b.bucket}"
  }
}

# add bucket policy to enforce encryption using AES-256
resource "aws_s3_bucket_policy" "bp" {
  bucket = "${aws_s3_bucket.b.id}"
  policy = "${data.template_file.bucket-policy-aes256.rendered}"
}


# generate a random alphanumeric string as a bucket suffix
resource "random_id" "server" {
  keepers = {
    # Generate a new id each time we switch to a bucket name
    bucket = "${var.bucket}"
  }
 # hex values are 2 x byte_length
  byte_length = 3
}


# bucket suffix, add hyphen if bucket_suffix != ""
locals {
  bucket_suffix_hyphen = "-${var.bucket_suffix}"
  bucket_suffix = "${var.bucket_suffix != "" ? local.bucket_suffix_hyphen: var.bucket_suffix }"
}

# random_id suffix, add hyphen, only use if random_id_suffix_enable=1
locals {
  random_id_suffix_hyphen = "-${random_id.server.hex}"
  random_id_suffix_none = ""
  random_id_suffix = "${var.random_id_suffix_enable == 1 ? local.random_id_suffix_hyphen : local.random_id_suffix_none }"
}

# Merge bucket name + bucket_suffix + random alpha-numeric suffix
locals {
  bucket = "${var.bucket}${local.bucket_suffix}${local.random_id_suffix}"
}


# Ensure that common_tags get created consistently
locals {
  common_tags = {
    created_by = "terraform"
    project_id   = ""
    project_name = ""
    environment  = ""
    component    = ""
  }
  common_tags_merged = "${merge(local.common_tags, var.common_tags)}"
}


# Merge tag sets
locals {
  tags = "${merge(local.common_tags_merged, var.other_tags)}"
}



