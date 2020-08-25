#************************************************
# AWS VPC and ENV configuration
#************************************************
variable environment {
  description = "Account environment"
  default     = "prod"
}

variable aws_region {
  description = "Default AWS region"
  type        = string
  default     = "us-east-1"
  validation {
    condition     = can(regex("^us-", var.aws_region))
    error_message = "This Terraform is supposed to run in us-east-1."
  }
}
#
variable "vpc_public_subnets" {
  type = map
  default = {
    us-east-1a = "10.0.1.0/24"
    us-east-1b = "10.0.2.0/24"
    us-east-1c = "10.0.3.0/24"
  }
}
