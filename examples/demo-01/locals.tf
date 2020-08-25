locals {
  subnet_ids_string = join(",", data.aws_subnet_ids.public_subnets.ids)
  subnet_ids_list   = split(",", local.subnet_ids_string)
}
