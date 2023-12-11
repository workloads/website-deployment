# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution#custom-error-response-arguments
variable "custom_error_responses" {
  type = list(object({
    error_caching_min_ttl = optional(number)
    error_code            = number
    response_code         = optional(number)
    response_page_path    = optional(string)
  }))

  description = "List of Custom Error Response Element Objects for the distribution."

  default = [
    {
      error_code         = 404
      response_code      = 404
      response_page_path = "/404.html"
    }
  ]
}

variable "domain" {
  type        = string
  description = "Website Domain."
  default     = "workloads.io"
}

variable "github_owner" {
  type        = string
  description = "This is the target GitHub Organization."
  default     = "workloads"
}

variable "github_token" {
  type        = string
  description = "This is the GitHub Token."
  sensitive   = true
}

variable "hugo_deploy_toml_target_branch" {
  type        = string
  description = "The name of the Git Branch to write the Hugo Deployment configuration to."
  default     = "switches-to-hugo" #"main"
}

variable "hugo_deploy_toml_target_file" {
  type        = string
  description = "The name of the file to write the Hugo Deployment configuration to."
  default     = "hugo-deploy.toml"
}

variable "hugo_deploy_toml_target_repository" {
  type        = string
  description = "The name of the repository to write the Hugo Deployment configuration file to."
  default     = "website"
}

variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "subdomain" {
  type        = string
  description = "Website Subdomain."
  default     = "www"
}

variable "preview_subdomain" {
  type        = string
  description = "Preview Website Subdomain."
  default     = "preview"
}
