# Changelog

All notable changes to tf-aws-s3 will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).



## v0.2
* remove bucket policy feature for encryption. Additional bucket policies can be added using aws_s3_bucket_policy https://www.terraform.io/docs/providers/aws/r/s3_bucket_policy.html
* Add object lifecycle rule to abort incomplete multi-part uploads
* Add 2 S3 bucket examples
* change terraform tag to use defacto approach "terraform" = "true"

## v0.1
* Set bucket policy
* Set ACL as 'private' by default
* Use bucket name suffix
* Use a random id suffix
* Enable versioning
* Prevent destroy
* Force destroy of all objects before deletion

## Unreleased
* bucket policy examples
* lifecycle templates
* bucket logging
