resource "aws_iam_policy" "my_policy" {
    
    policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:ListBucket",
          "s3:GetBucketLocation",
          "s3:ListAllMyBuckets"
        ],
        Resource = [
          "*", # Allow listing all S3 buckets, 
        ],
        Effect = "Allow",
      },
      {
        Action = [
          "s3:GetObject",
        ],
        Resource = [
          "arn:aws:s3:::alibaba-bucket/*", # Replace with your S3 bucket name
        ],
        Effect = "Allow",
      }
    ]
  })
}