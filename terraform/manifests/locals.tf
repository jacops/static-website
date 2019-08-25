locals {
  resource_affix = "${var.environment}-"
  common_tags = {
    Source      = "Terraform"
    Owner       = data.aws_caller_identity.current.account_id
    Environment = var.environment
  }
}
