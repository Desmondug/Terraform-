import boto3

# Create an S3 client
s3 = boto3.client('s3', region_name='us-east-1')
# Specify the name of your S3 bucket
bucket_name = 'alibaba-bucket'

# List objects in the bucket
response = s3.list_objects_v2(Bucket=bucket_name)

# Print the object names (Object Key)
if 'Contents' in response:
    for obj in response['Contents']:
        print(f"Object Key: {obj['Key']}")
else:
    print("The bucket is empty.")
