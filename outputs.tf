//
// Module: tf-aws-s3
//
// Outputs


# The name of the bucket.
output "id" {
   value = "${aws_s3_bucket.b.id}"
}

# The ARN of the bucket. Will be of format arn:aws:s3:::bucketname
output "arn" {
   value = "${aws_s3_bucket.b.arn}"
}


# The AWS region this bucket resides in
output "region" {
   value = "${aws_s3_bucket.b.region}"
}
