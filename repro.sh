#! /bin/bash
set -x
awslocal s3api create-bucket --bucket test-bucket
awslocal s3api get-bucket-versioning --bucket test-bucket # nothing printed
awslocal s3 cp ./test.txt s3://test-bucket/test.txt
awslocal s3api copy-object --bucket test-bucket --key test.txt --copy-source='test-bucket/test.txt' --metadata-directive REPLACE # succeeds
awslocal s3api put-bucket-versioning --bucket test-bucket --versioning-configuration Status=Suspended
awslocal s3api copy-object --bucket test-bucket --key test.txt --copy-source='test-bucket/test.txt' --metadata-directive REPLACE # never finishes