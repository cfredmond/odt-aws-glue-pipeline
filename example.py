import sys
from awsglue.transforms import *
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Initialize a Glue context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)

# Extract data from S3
input_data = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={"paths": ["s3://your-input-bucket/input-data.csv"]},
    format="csv",
)

# Transform data (example: filtering rows where column 'age' > 25)
transformed_data = Filter.apply(frame=input_data, f=lambda row: row["age"] > 25)

# Load transformed data back to another S3 bucket
glueContext.write_dynamic_frame.from_options(
    frame=transformed_data,
    connection_type="s3",
    connection_options={"path": "s3://your-output-bucket/transformed-data"},
    format="csv",
)

job.commit()
