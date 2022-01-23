provider "aws" {
  region = var.region
}

provider "aws" {
  alias = "acm_provider"
  region = "us-east-1"
}

provider "postgresql" {
  host = aws_db_instance.app_db.address
  username = aws_db_instance.app_db.username
  password = aws_db_instance.app_db.password
}
