resource "aws_acm_certificate" "this" {
  domain_name       = var.acm_certificate.domain_name
  validation_method = var.acm_certificate.validation_method
  tags = var.tags
}