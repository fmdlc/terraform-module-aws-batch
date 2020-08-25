#-------------------------------------------------------------------------
# Route table definition
#-------------------------------------------------------------------------
# -> Public VPC:
#   - us-east-1a - 10.0.1.0/24 -> 0.0.0.0/0
#   - us-east-1b - 10.0.2.0/24 -> 0.0.0.0/0
#   - us-east-1c - 10.0.3.0/24 -> 0.0.0.0/0
#-------------------------------------------------------------------------
resource "aws_route_table" "route-us-east-1" {
  for_each = var.vpc_public_subnets
  vpc_id   = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name      = "main"
    Terraform = "True"
  }
}

resource "aws_route_table_association" "us-east-1" {
  count          = 3
  subnet_id      = format("%v", [for k in (element(aws_subnet.main-us-east.*, count.index)): k.id][count.index])
  route_table_id = format("%v", [for k in (element(aws_route_table.route-us-east-1.*, count.index)): k.id][count.index])
}

