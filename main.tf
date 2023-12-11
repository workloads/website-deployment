locals {
  # random string for use with S3 Bucket names
  bucket_suffix = "site-${random_string.bucket_suffix.id}"

  # take domain name and remove dot characters from string, then append suffix with random string
  bucket_name_website         = "${replace(var.domain, ".", "")}-${local.bucket_suffix}"
  bucket_name_preview_website = "${replace(var.domain, ".", "")}-${var.preview_subdomain}-${local.bucket_suffix}"
}

# live website; likely to be located at `${var.domain}` and `www.${var.domain}`
# see https://registry.terraform.io/modules/ksatirli/cloudfront-website/aws/1.2.0
module "website" {
  source  = "ksatirli/cloudfront-website/aws"
  version = "1.2.0"

  # see https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations
  providers = {
    # NOTE: ACM Certificates for usage with CloudFront must be created in the `us-east-1` region, see https://amzn.to/2TW2J16
    aws.certificate = aws.certificate
  }

  alternate_subdomain_names = [
    var.domain
  ]

  domain_name    = var.domain
  subdomain_name = var.subdomain

  s3_bucket_name = local.bucket_name_website
}

# preview website; likely to be located at `preview.${var.domain}`
# see https://registry.terraform.io/modules/ksatirli/cloudfront-website/aws/1.2.0
module "preview_website" {
  source  = "ksatirli/cloudfront-website/aws"
  version = "1.2.0"

  # see https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations
  providers = {
    # NOTE: ACM Certificates for usage with CloudFront must be created in the `us-east-1` region, see https://amzn.to/2TW2J16
    aws.certificate = aws.certificate
  }

  alternate_subdomain_names = []

  domain_name    = var.domain
  subdomain_name = var.preview_subdomain

  s3_bucket_name = local.bucket_name_preview_website
}

