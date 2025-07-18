provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source            = "../../modules/vpc"
  project_name      = var.project_name
  availability_zone = var.az
}

module "ecs" {
  source             = "../../modules/ecs"
  project_name       = var.project_name
  container_name     = "myapp"
  container_image    = var.container_image
  execution_role_arn = var.execution_role_arn
  subnet_ids         = [module.vpc.public_subnet_id]
  security_group_ids = [aws_security_group.app_sg.id]
}

module "codebuild" {
  source           = "../../modules/codebuild"
  project_name     = var.project_name
  service_role_arn = var.codebuild_role_arn
  source_location  = var.github_repo_url
  buildspec        = "buildspec.yml"
}

module "codepipeline" {
  source                 = "../../modules/codepipeline"
  project_name           = var.project_name
  pipeline_role_arn      = var.pipeline_role_arn
  artifact_bucket        = var.artifact_bucket
  github_owner           = var.github_owner
  github_repo            = var.github_repo
  github_branch          = var.github_branch
  github_token           = var.github_token
  codebuild_project_name = module.codebuild.project_name
}

resource "aws_security_group" "app_sg" {
  name   = "${var.project_name}-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
