terraform {
  required_version = "~> 1.11.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.93.0"
    }
  }

  backend "s3" {
    bucket       = "terraform-state-asl-foundation"
    key          = "foundation/terraform.tfstate"
    region       = "us-west-2"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region = "us-west-2"
  alias  = "management"

  default_tags {
    tags = {
      terraform_managed = true
      account           = "foundation"
    }
  }
}
