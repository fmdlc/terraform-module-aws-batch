#-------------------------------------------------------------------------
# VPC definition
#-------------------------------------------------------------------------
# -> us-east-1a, us-east-1b, us-east-1c
#-------------------------------------------------------------------------
# -> Public VPC	:
#   - us-east-1a - 10.0.1.0/24
#   - us-east-1b - 10.0.2.0/24
#   - us-east-1c - 10.0.3.0/24
#-------------------------------------------------------------------------
resource "aws_vpc" "main" {
  cidr_block           = var.environment == "prod" ? "10.0.0.0/16" : "192.168.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name      = "main"
    Terraform = "True"
  }

}

resource "aws_subnet" "main-us-east" {
  for_each          = var.vpc_public_subnets
  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name      = "subnet-${each.key}"
    Terraform = "True"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name      = "main"
    Terraform = "True"
  }
}
