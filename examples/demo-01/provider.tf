#------------------------------------------------------------------------------
# AWS provider definition
#	After generate your AWS Access/Secret key set your AWS profile name here.
# 	Configure your aws profile calling the awscli
#	$ aws config --profile <profile_name>
#
#------------------------------------------------------------------------------
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      region = "us-east-1"
    }
  }
}
