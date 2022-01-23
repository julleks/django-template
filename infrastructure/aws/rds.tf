resource "aws_db_instance" "app_db" {
  identifier = "${var.project_name}-postgres"
  allocated_storage = 20
  max_allocated_storage = 100
  backup_retention_period = 7
  backup_window = "02:46-03:16"
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "11"
  instance_class = var.pg_instance_class
  username = var.pg_username
  password = aws_secretsmanager_secret_version.pg_password.secret_string
  publicly_accessible = true
  deletion_protection = true
  multi_az = true
  final_snapshot_identifier = "final"
  vpc_security_group_ids = [aws_security_group.sg_postgres.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet.name

  tags = {
    Name = "${var.project_name}-postgres"
    Project = var.project_name
    Terraform = true
  }
}

# TODO: find out how to configure several databases
#resource "postgresql_database" "db" {
#  for_each = var.environments
#
#  name = "${var.project_name}_${each.key}"
#}
