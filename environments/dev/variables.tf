variable "project_name" {}
variable "az" {}
variable "container_image" {}
variable "execution_role_arn" {}
variable "codebuild_role_arn" {}
variable "pipeline_role_arn" {}
variable "github_repo_url" {}
variable "artifact_bucket" {}
variable "github_owner" {}
variable "github_repo" {}
variable "github_branch" { default = "main" }
variable "github_token" {}
