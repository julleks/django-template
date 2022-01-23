resource "random_password" "pg_password" {
  length = 36
  special = false
}

resource "aws_secretsmanager_secret" "pg_password" {
  name = "${var.project_name}-pg-password"

  tags = {
    Name = "${var.project_name}-pg-password"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_secretsmanager_secret_version" "pg_password" {
  secret_id = aws_secretsmanager_secret.pg_password.id
  secret_string = random_password.pg_password.result
}

resource "random_password" "django_secret_key" {
  length = 50
  special = false
}


resource "aws_secretsmanager_secret" "django_secret_key" {
  name = "${var.project_name}-secret-key"

  tags = {
    Name = "${var.project_name}-secret-key"
    Project = var.project_name
    Terraform = true
  }
}

resource "aws_secretsmanager_secret_version" "django_secret_key" {
  secret_id = aws_secretsmanager_secret.django_secret_key.id
  secret_string = random_password.django_secret_key.result
}
