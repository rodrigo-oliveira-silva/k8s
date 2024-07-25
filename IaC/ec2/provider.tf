terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.59.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "cluster-study"

  default_tags {
    tags = {
      Project     = "Study-k8s"
      Terraform   = "true"
      Environment = "Dev"
    }
  }
}