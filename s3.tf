
# Fetch existing S3 bucket (if it exists)
data "aws_s3_bucket" "existing" {
  bucket = govtest-cleo-test1 
}

# Create S3 bucket only if it does not exist
resource "aws_s3_bucket" "terraform_state" {
  count  = length(data.aws_s3_bucket.existing.id) > 0 ? 0 : 1
  bucket = govtest-cleo-test1

  lifecycle {
    prevent_destroy = true
  }

  versioning {
    enabled = true
  }

  tags = {
    Name = "Terraform State Bucket"
  }
}

