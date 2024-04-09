provider "aws" {
  region = var.aws_provider.region
  assume_role {
    role_arn = var.aws_provider.assume_role_arn
  }
}
