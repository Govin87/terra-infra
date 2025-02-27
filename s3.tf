# Check if the S3 bucket already exists
data "aws_s3_bucket" "terraform_state" {
  bucket = "govtest-cleo-test1"
}

# Create the bucket only if it doesn't exist
resource "aws_s3_bucket" "terraform_state" {
  count  = length(data.aws_s3_bucket.terraform_state.id) > 0 ? 0 : 1
  bucket = "govtest-cleo-test1"
  
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

