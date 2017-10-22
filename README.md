# tf-aws-s3 terraform module

Terraform module to create templated S3 buckets

## Features
* Set bucket policy
* Set ACL as 'private' by default
* Use bucket name suffix
* Use a random id suffix
* Enable versioning
* Prevent destroy
* Force destroy of all objects before deletion


## Dependencies
None



## Inputs
#### Required


#### Optional
* `bucket` -  (Optional, Forces new resource) The name of the bucket. If omitted, Terraform will assign a random, unique name.
* `region` -  (Optional) If specified, the AWS region this bucket should reside in. Otherwise, the region used by the callee.
* `bucket_suffix` - Add a bucket suffix to the bucket name. eg bucketname-suffix  bucket_suffix = "" disables the feature
* `random_id_suffix_enable` - enable/disable random_id_suffix feature eg bucketname-d56gx7 or bucketname-suffix-d56gx7
* `acl` - set the canned ACL on the bucket. Default is private
* `enable_versioning` - Enable versioning on the bucket
* `force_destroy` - A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error
* `common_tags` - Set common tags on the bucket
* `other_tags` - Set any other tags that are required
* `prevent_destroy` - Terraform lifecycle rule to prevent the removal of a bucket during a destroy


## Usage
```
module "my_bucket" {
  source            = "github.com/bmacauley/tf-aws-s3?ref=v0.1"
  bucket            = "test-user"
  acl               = "private"
  enable_versioning = true
  common_tags  = {
    "created_by"   =  "terraform"
    "project_id"   =  "p1234567"
    "project_name" =  "test"
    "environment"  =  "dev"
    "component"    =  "bucket"

  }

}
```

## Outputs
* `id` - The name of the bucket
* `arn` - The ARN of the bucket. Will be of format arn:aws:s3:::bucketname
* `region` - The AWS region this bucket resides in


## Authors
* [Brian Macauley](https://github.com/bmacauley) &lt;brian.macauley@gmail.com&gt;

## License
[MIT](/LICENSE)
