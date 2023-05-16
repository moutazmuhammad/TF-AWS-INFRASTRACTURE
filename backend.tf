# Remote state file
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "terraform-remote-s3-statefile"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "lock_management-table"
  }
}
