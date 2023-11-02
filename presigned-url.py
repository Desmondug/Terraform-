import boto3
from botocore.exceptions import NoCredentialsError

# Create an S3 client
s3 = boto3.client('s3', region_name='us-east-1')

# Specify the name of your S3 bucket and the object key you want to generate a pre-signed URL for
bucket_name = 'alibaba-bucket' # Replace with the actual bucket name
object_key = '2023 Updated Resume .pdf'  # Replace with the actual object key

# Generate a pre-signed URL for the object with a 1-hour expiration time (you can adjust the expiration time)
try:
    presigned_url = s3.generate_presigned_url(
        'get_object',
        Params={'Bucket': bucket_name, 'Key': object_key},
        ExpiresIn=360000  # Expiration time in seconds (1 hour in this example)
    )
    
    # Print the pre-signed URL
    print(f"Pre-signed URL for '{object_key}':")
    print(presigned_url)

except NoCredentialsError:
    print("No AWS credentials found. Make sure you have configured your credentials.")

except Exception as e:
    print(f"An error occurred: {str(e)}")
