#------------------------------------------------------------------------------
# AWS Backend configuration
#
#------------------------------------------------------------------------------
terraform {
  backend "s3" {
    bucket = "fdelacruz-tfstate"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
