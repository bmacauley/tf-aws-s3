# tf-aws-s3 terraform module

Terraform module to create S3 buckets

## Features
* Set canned ACL, 'private' by default
* Enable bucket name suffix
* Enable random id suffix
* Enable versioning
* Prevent destroy
* Force destroy of all objects before deletion


## Dependencies
None



## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| acl | Set canned ACL on bucket. Valid values are private, public-read, public-read-write, aws-exec-read, authenticated-read, bucket-owner-read, bucket-owner-full-control, log-delivery-write | string | `private` | no |
| aws_region | AWS region | string | `eu-west-1` | no |
| bucket | Bucket name | string | `my-s3-bucket` | no |
| bucket_suffix | enable bucket name suffix eg my-bucket-suffix | string | `suffix` | no |
| common_tags | common tags for bucket | map | `<map>` | no |
| enable_versioning | Enable versioning on the bucket | string | `false` | no |
| force_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error | string | `false` | no |
| kms_master_key_id | The AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms | string | `` | no |
| lifecycle_abort_incomplete_multipart_upload |  | string | `true` | no |
| lifecycle_abort_incomplete_multipart_upload_days |  | string | `7` | no |
| other_tags | other tags for bucket | map | `<map>` | no |
| prevent_destroy | lifecycle rule to prevent the removal of a bucket during a destroy | string | `false` | no |
| random_id_suffix | enable random_id suffix on bucket name eg my-bucket-de48g5 | string | `true` | no |
| region | If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee | string | `eu-west-1` | no |
| sse_algorithm | The server-side encryption algorithm to use. Valid values are AES256 and aws:kms | string | `AES256` | no |


## Outputs
| Name | Description |
|------|-------------|
| arn | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname |
| id | The name of the bucket. |
| region | The AWS region this bucket resides in |


## Usage
```
module "my_bucket" {
  source            = "github.com/bmacauley/tf-aws-s3?ref=v0.1"
  bucket            = "test-bucket"
  acl               = "private"
  sse_algorithm     = "AES256"
  enable_versioning = true
  common_tags  = {
    "terraform"   =  "true"
    "project_id"   =  "p000123"
    "project_name" =  "test"
    "environment"  =  "sbx"
    "component"    =  "bucket"
  }
}
```


## Examples
[s3 bucket, default encryption, AES256](/examples/s3_bucket_default_encryption)  

[s3 bucket, default encryption, kms key](/examples/s3_bucket_kms_encryption)  



## Authors
* [Brian Macauley](https://github.com/bmacauley) &lt;brian.macauley@gmail.com&gt;

## License
[MIT](/LICENSE)
