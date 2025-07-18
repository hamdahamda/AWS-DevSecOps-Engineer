# CodePipeline Terraform Module

Modul ini membuat pipeline CI/CD otomatis dengan AWS CodePipeline, yang terhubung dengan GitHub dan CodeBuild.

## 📦 Resource yang Dibuat

- AWS CodePipeline
- Source stage dari GitHub
- Build stage dengan CodeBuild
- Artifact store (S3)

## 🔧 Input Variables

| Nama                    | Deskripsi                                      |
|-------------------------|------------------------------------------------|
| `project_name`          | Nama proyek                                    |
| `pipeline_role_arn`     | IAM role untuk menjalankan pipeline            |
| `artifact_bucket`       | S3 bucket tempat menyimpan artifact            |
| `github_owner`          | Nama pemilik repo GitHub                       |
| `github_repo`           | Nama repo                                      |
| `github_branch`         | Branch yang akan dipantau (default: `main`)    |
| `github_token`          | GitHub personal access token                   |
| `codebuild_project_name`| Nama project CodeBuild yang digunakan          |

## 📤 Output

| Nama Output     | Deskripsi             |
|------------------|------------------------|
| `pipeline_name`  | Nama pipeline          |

## 🚀 Contoh Penggunaan

```hcl
module "codepipeline" {
  source                 = "../../modules/codepipeline"
  project_name           = "myapp"
  pipeline_role_arn      = "arn:aws:iam::123456789012:role/codepipeline-role"
  artifact_bucket        = "myapp-artifacts-bucket"
  github_owner           = "hamda"
  github_repo            = "myapp-repo"
  github_token           = "ghp_*************"
  codebuild_project_name = module.codebuild.project_name
}