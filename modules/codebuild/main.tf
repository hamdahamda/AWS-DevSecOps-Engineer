resource "aws_codebuild_project" "this" {
  name          = "${var.project_name}-build"
  description   = "CodeBuild project for ${var.project_name}"
  service_role  = var.service_role_arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

environment {
  compute_type                = "BUILD_GENERAL1_SMALL"
  image                       = var.build_image
  type                        = "LINUX_CONTAINER"
  privileged_mode             = true

  dynamic "environment_variable" {
    for_each = var.env_variables
    content {
      name  = environment_variable.value.name
      value = environment_variable.value.value
    }
  }
}


  source {
    type            = "GITHUB"
    location        = var.source_location
    buildspec       = var.buildspec
  }
}
