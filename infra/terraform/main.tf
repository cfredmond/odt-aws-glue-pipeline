resource "aws_s3_bucket" "example" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "My bucket"
    Environment = var.environment
  }
}

# Create an S3 bucket object
resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.example.bucket
  key    = "example.py"
  source = var.local_file_path
}

resource "aws_glue_job" "example" {
  name     = "example"
  role_arn = var.iam_role_arn

  command {
    script_location = "s3://${aws_s3_bucket.example.bucket}/example.py"
  }
}
