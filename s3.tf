# Create the S3 bucket for Terraform state storage
resource "aws_s3_bucket" "terraform_state" {
  bucket = "govtest-cleo-test1"  # Change this to your actual bucket name

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

# Optional: DynamoDB table for Terraform state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

