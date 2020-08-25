data "aws_subnet_ids" "public_subnets" {
  vpc_id = aws_vpc.main.id
}
