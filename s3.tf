resource "aws_s3_bucket" "terraform_state" {
  bucket = "govtest-cleo-test2"


  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

