# localstack s3 CopyObject issue repro

## Prerequisites

- Localstack (Latest)
- `awslocal` installed

## Steps

- Start localstack (Docker, `localstack` command, etc.)
- Run `chmod +x repro.sh`
- Run `./repro.sh`

The reproduction script does the following:

- Creates a new bucket (`'test-bucket'`) with no `VersioningConfiguration` specified
- Uploads a test file (`'test.txt'`) into the new bucket
- Copies the file to itself (successfully)
- Explicitly sets the `VersioningConfiguration` of the bucket to `Status=Suspended`
- Attempts to copy the file to itself once more
- Hangs indefinitely
