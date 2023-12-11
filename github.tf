locals {
  # see https://developer.hashicorp.com/terraform/language/functions/templatefile
  hugo_deploy_toml = templatefile("./templates/hugo-deploy.tftpl.toml", {
    # deployment target "preview"
    preview_website_bucket_name                = module.preview_website.aws_s3_bucket.id
    preview_website_bucket_region              = module.preview_website.aws_s3_bucket.region
    preview_website_cloudfront_distribution_id = module.preview_website.aws_cloudfront_distribution.id

    # deployment target "live"
    website_bucket_name                = module.website.aws_s3_bucket.id
    website_bucket_region              = module.website.aws_s3_bucket.region
    website_cloudfront_distribution_id = module.website.aws_cloudfront_distribution.id
  })
}

# see https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file
resource "github_repository_file" "hugo_deploy_toml" {
  repository          = var.hugo_deploy_toml_target_repository
  branch              = var.hugo_deploy_toml_target_branch
  file                = var.hugo_deploy_toml_target_file
  content             = local.hugo_deploy_toml
  overwrite_on_create = true
}
