output "aws_cli_commands" {
  description = "AWS CLI Command for CloudFront operations."

  value = {
    create_invalidation = "aws cloudfront create-invalidation --distribution-id '${module.website.aws_cloudfront_distribution.id}' --paths '/*'"
  }
}

output "aws_cloudfront_aliases_website" {
  description = "Exported Attributes for `module.website.aws_cloudfront_distribution.aliases`."
  value       = module.website.aws_cloudfront_distribution.aliases
}

output "aws_cloudfront_domain_name_website" {
  description = "Exported Attribute for `module.website.aws_cloudfront_distribution.domain_name`."
  value       = module.website.aws_cloudfront_distribution.domain_name
}

output "aws_cloudfront_domain_name_preview_website" {
  description = "Exported Attribute for `module.website.aws_cloudfront_distribution.domain_name`."
  value       = module.preview_website.aws_cloudfront_distribution.domain_name
}

output "aws_console_urls" {
  description = "AWS Console URLs."

  value = [
    "https://s3.console.aws.amazon.com/s3/buckets/${module.website.aws_s3_bucket.bucket}?region=${var.management_region_aws}&tab=objects",
    "https://s3.console.aws.amazon.com/s3/buckets/${module.preview_website.aws_s3_bucket.bucket}?region=${var.management_region_aws}&tab=objects",
    "https://us-east-1.console.aws.amazon.com/cloudfront/v3/home?region=${var.management_region_aws}#/distributions/${module.website.aws_cloudfront_distribution.id}",
    "https://us-east-1.console.aws.amazon.com/cloudfront/v3/home?region=${var.management_region_aws}#/distributions/${module.preview_website.aws_cloudfront_distribution.id}",
  ]
}

output "aws_s3_bucket_website" {
  description = "Exported Attribute for `module.website.aws_s3_bucket`."
  value       = module.website.aws_s3_bucket.bucket
}

output "aws_s3_bucket_preview_website" {
  description = "Exported Attribute for `module.preview_website.aws_s3_bucket`."
  value       = module.preview_website.aws_s3_bucket.bucket
}

output "github_repository_file_hugo_deploy_toml" {
  description = "Exported Attribute for `module.github_repository_file.hugo_deploy_toml`."
  value       = github_repository_file.hugo_deploy_toml
}

output "tfe_workspace_terraform_version" {
  description = "Terraform version identifier of current HCP Terraform Workspace."
  value       = data.tfe_workspace.main.terraform_version
}
