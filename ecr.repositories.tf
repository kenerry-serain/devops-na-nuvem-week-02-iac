resource "aws_ecr_repository" "frontend" {
  name                 = var.ecr_repositories.frontend
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "backend" {
  name                 =  var.ecr_repositories.backend
  image_tag_mutability = "MUTABLE"
}
