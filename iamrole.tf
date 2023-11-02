resource "aws_iam_role" "ec2" {
  name = "ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    name = "ec2-role"
  }
}

resource "aws_iam_role_policy_attachment" "policy_attach" {
  role = aws_iam_role.ec2.name
  policy_arn = aws_iam_policy.my_policy.arn
}