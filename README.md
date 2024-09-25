# AWS Glue Job with Terraform and Python

This project demonstrates how to create and run an AWS Glue job using Terraform (`main.tf`) and a Python script (`example.py`). The solution extracts data from an S3 bucket, transforms it using AWS Glue, and loads the transformed data back into another S3 bucket.

## Files Overview

### 1. `main.tf`
This Terraform configuration file defines the following resources:
- **AWS S3 Bucket**: Creates an S3 bucket for storing the Python script (`example.py`) used by the Glue job.
- **S3 Object**: Uploads the Python script (`example.py`) to the created S3 bucket.
- **AWS Glue Job**: Sets up an AWS Glue job that uses the uploaded script to perform data transformations.

#### Key Components
- `aws_s3_bucket`: Creates an S3 bucket named based on the `var.s3_bucket_name` variable.
- `aws_s3_object`: Uploads the `example.py` script to the S3 bucket.
- `aws_glue_job`: Creates an AWS Glue job named `example` using the script uploaded to S3.

### 2. `example.py`
This Python script is executed by the AWS Glue job. It uses the AWS Glue Python libraries to:
- Extract data from an S3 bucket.
- Transform the data (filters rows where the `age` column is greater than 25).
- Load the transformed data into another S3 bucket.

#### Key Components
- **Extract**: Reads CSV data from the input S3 bucket.
- **Transform**: Applies a filter transformation to retain rows with `age > 25`.
- **Load**: Writes the transformed data to an output S3 bucket.

## Prerequisites

- AWS CLI installed and configured
- Terraform installed
- Access to an AWS account with permissions to create S3 buckets, Glue jobs, and IAM roles

## Setup and Deployment

### 1. Configure Variables
Update the variables in your `terraform.tfvars` file or provide them directly in the `main.tf` file:
- `s3_bucket_name`: The name for the S3 bucket to store your Python script.
- `environment`: The environment (e.g., `dev`, `prod`).
- `iam_role_arn`: The ARN of the IAM role for the Glue job.
- `local_file_path`: The path to your local Python script (`example.py`).

### 2. Initialize Terraform
```bash
terraform init
```

### 3. Apply Terraform Configuration
```bash
terraform apply
```
Review and confirm the changes when prompted.

### 4. Run the Glue Job
Once deployed, the Glue job will be available in your AWS Glue console. You can start the job from there.

## How It Works
1. Terraform creates the necessary AWS resources, including the S3 bucket and Glue job.
2. The Python script (`example.py`) is uploaded to the S3 bucket.
3. The Glue job runs the script, extracting data from the specified input S3 bucket, transforming it, and loading the results into the output S3 bucket.

## Clean Up
To remove all resources created by Terraform, run:
```bash
terraform destroy
```

## Notes
- Ensure the input and output S3 bucket paths in `example.py` are correct for your environment.
- Make sure the IAM role specified has sufficient permissions for S3 and Glue operations.