data "aws_region" "current" {}

data "aws_route53_zone" "website" {
  name = var.domain_name
}

resource "aws_acm_certificate" "certificate" {
  private_key       = var.ssl_private_key
  certificate_body  = var.ssl_certificate_body
  certificate_chain = var.ssl_certificate_chain
}

module "site-main" {
  source = "github.com/jacops/terraform-website-s3-cloudfront-route53//site-main"

  region = data.aws_region.current.name
  domain = var.domain_name
  bucket_name = "website-${var.domain_name}"
  duplicate-content-penalty-secret = var.duplicate_content_penalty_secret
  deployer = var.deployer
  acm-certificate-arn = aws_acm_certificate.certificate.arn
  not-found-response-path = "/404.html"
}

module "dns-alias" {
  source = "github.com/jacops/terraform-website-s3-cloudfront-route53//r53-alias"

  domain = var.domain_name
  target = module.site-main.website_cdn_hostname
  cdn_hosted_zone_id = module.site-main.website_cdn_zone_id
  route53_zone_id = data.aws_route53_zone.website.zone_id
}