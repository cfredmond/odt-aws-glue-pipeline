variable "s3_bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., Dev, Staging, Prod)."
  type        = string
}

variable "local_file_path" {
  description = "The local path to the file you want to upload."
  type        = string
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for the Glue job."
  type        = string
}