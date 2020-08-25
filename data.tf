data "aws_subnet_ids" "subnets" {
  vpc_id = var.vpc_id
}