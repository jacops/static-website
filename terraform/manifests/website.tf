variable "domain_name" {}

resource "aws_iam_user" "website_deployer" {
  name = "jacops-website-deployer"
}

resource "random_string" "duplicate_content_penalty_secret" {
  length = 16
  special = false
}

module "website" {
  source = "../module"

  domain_name                      = var.domain_name
  duplicate_content_penalty_secret = random_string.duplicate_content_penalty_secret.result
  ssl_certificate_body             = file("../certs/live/${var.domain_name}/cert.pem")
  ssl_private_key                  = file("../certs/live/${var.domain_name}/privkey.pem")
  ssl_certificate_chain            = file("../certs/live/${var.domain_name}/fullchain.pem")
  deployer                         = aws_iam_user.website_deployer.name
}