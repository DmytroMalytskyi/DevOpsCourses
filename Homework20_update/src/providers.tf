terraform {
  backend "s3" {
    bucket  = "terraform-state-danit-devops-9"
    region  = "eu-central-1"
    key     = "terraform/state/dmytro/terraform.tfstate"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

