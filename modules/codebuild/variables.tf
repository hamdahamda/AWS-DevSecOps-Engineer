variable "project_name" {}
variable "service_role_arn" {}
variable "build_image" { default = "aws/codebuild/standard:6.0" }
variable "source_location" {}
variable "buildspec" { default = "buildspec.yml" }
variable "env_variables" {
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}
