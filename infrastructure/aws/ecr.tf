resource "aws_ecr_repository" "app" {
  for_each = var.environments

  name = "${var.project_name}-${each.key}"
  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "${var.project_name}-${each.key}"
    Project = var.project_name
    Terraform = true
  }
}
