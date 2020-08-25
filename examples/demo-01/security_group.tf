resource "aws_security_group" "trusted" {
  name        = "trusted_sg"
  description = "Trusted Security Group for trusted address"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Allow internal access"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "TrustedSG"
    Terraform = "True"
  }
}
