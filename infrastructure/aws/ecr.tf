resource "aws_ecr_repository" "app" {
  for_each = var.environments

  name = "${var.project_name}-${each.key}"
  image_tag_mutability = "MUTABLE"
}
