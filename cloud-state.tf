resource "aws_s3_bucket" "terraform_state" {
  bucket   = "terraform-state-asl-foundation"
  provider = aws.management

  tags = {
    Name = "Terraform State Bucket"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket   = aws_s3_bucket.terraform_state.id
  provider = aws.management


  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "terraform_state_lifecycle" {
  bucket   = aws_s3_bucket.terraform_state.id
  provider = aws.management

  rule {
    id     = "expire-old-versions"
    status = "Enabled"

    filter {
      prefix = "" # Applies to all objects in the bucket
    }

    transition {
      days          = 30
      storage_class = "GLACIER_IR"
    }

    noncurrent_version_transition {
      noncurrent_days = 7
      storage_class   = "GLACIER_IR"
    }

    noncurrent_version_expiration {
      newer_noncurrent_versions = 1
      noncurrent_days           = 30
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket   = aws_s3_bucket.terraform_state.id
  provider = aws.management

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state_public_access" {
  bucket   = aws_s3_bucket.terraform_state.id
  provider = aws.management

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
