resource "aws_iam_instance_profile" "instance_profile" {
  role = aws_iam_role.ec2.name
  name = "alibaba-instance-profile"
}
resource "aws_instance" "ec2_instance" {
  ami = "ami-01eccbf80522b562b"
  instance_type = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  key_name = "mykp"
  vpc_security_group_ids = [aws_security_group.ec2sg.id]

    tags = {
      name = "alibaba-instance"
    }
}

resource "aws_security_group" "ec2sg" {
  name = "alibaba sg"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"  
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH into ec2"
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow hhtp traffic to the internet"
  }
  
}