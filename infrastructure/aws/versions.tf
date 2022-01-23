terraform {
  required_version = ">= 1.1.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.72.0"
    }
#    postgresql = {
#      source = "cyrilgdn/postgresql"
#      version = "1.14.0"
#    }
  }
}
