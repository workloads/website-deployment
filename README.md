# HCP Terraform Workspace `website`

> This repository manages website configuration for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [HCP Terraform Workspace `website`](#hcp-terraform-workspace-website)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
    * [Development](#development)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Notes](#notes)
    * [Sensitive Data](#sensitive-data)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.9.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

### Development

For development and testing of this repository:

- `terraform-docs` `0.18.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| github_token | This is the GitHub Token. | `string` | yes |
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| custom_error_responses | List of Custom Error Response Element Objects for the distribution. | <pre>list(object({<br>    error_caching_min_ttl = optional(number)<br>    error_code            = number<br>    response_code         = optional(number)<br>    response_page_path    = optional(string)<br>  }))</pre> | no |
| domain | Website Domain. | `string` | no |
| github_owner | This is the target GitHub Organization. | `string` | no |
| hugo_deploy_toml_target_branch | The name of the Git Branch to write the Hugo Deployment configuration to. | `string` | no |
| hugo_deploy_toml_target_file | The name of the file to write the Hugo Deployment configuration to. | `string` | no |
| hugo_deploy_toml_target_repository | The name of the repository to write the Hugo Deployment configuration file to. | `string` | no |
| preview_subdomain | Preview Website Subdomain. | `string` | no |
| subdomain | Website Subdomain. | `string` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_cli_commands | AWS CLI Command for CloudFront operations. |
| aws_cloudfront_aliases_website | Exported Attributes for `module.website.aws_cloudfront_distribution.aliases`. |
| aws_cloudfront_domain_name_preview_website | Exported Attribute for `module.website.aws_cloudfront_distribution.domain_name`. |
| aws_cloudfront_domain_name_website | Exported Attribute for `module.website.aws_cloudfront_distribution.domain_name`. |
| aws_console_urls | AWS Console URLs. |
| aws_s3_bucket_preview_website | Exported Attribute for `module.preview_website.aws_s3_bucket`. |
| aws_s3_bucket_website | Exported Attribute for `module.website.aws_s3_bucket`. |
| github_repository_file_hugo_deploy_toml | Exported Attribute for `module.github_repository_file.hugo_deploy_toml`. |
<!-- END_TF_DOCS -->

## Notes

### Sensitive Data

Terraform state may contain [sensitive data](https://developer.hashicorp.com/terraform/language/state/sensitive-data). This workspace uses [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs) to safely store state, and encrypt the data at rest.

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/website-deployment/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
