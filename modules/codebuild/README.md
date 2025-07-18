# AWS CodeBuild Terraform Module

Modul ini membuat satu AWS CodeBuild Project untuk membangun source code atau Docker image secara otomatis sebagai bagian dari pipeline CI/CD.

## 🔧 Resource yang Diciptakan

- `aws_codebuild_project`: Proyek CodeBuild
- Konfigurasi build environment
- Integrasi ke GitHub sebagai source
- Support variabel lingkungan

---

## 📥 Input Variables

| Nama                | Tipe   | Deskripsi                                       | Contoh                                 |
|---------------------|--------|-------------------------------------------------|-----------------------------------------|
| `project_name`       | string | Nama unik untuk project                         | `"myapp"`                               |
| `service_role_arn`   | string | ARN dari IAM Role untuk CodeBuild               | `"arn:aws:iam::123456789012:role/codebuild-role"` |
| `build_image`        | string | Image Docker untuk lingkungan build             | `"aws/codebuild/standard:6.0"`          |
| `source_location`    | string | URL repo GitHub                                 | `"https://github.com/org/repo"`         |
| `buildspec`          | string | Lokasi file buildspec.yml                       | `"buildspec.yml"`                       |
| `env_variables`      | list   | List dari environment variables                 | `[{ name = "FOO", value = "bar" }]`     |

---

## 📤 Output

| Nama Output         | Deskripsi                            |
|---------------------|----------------------------------------|
| `project_name`      | Nama project CodeBuild yang dibuat     |

---

## 🧪 Contoh Penggunaan

```hcl
module "codebuild" {
  source           = "../../modules/codebuild"
  project_name     = "myapp"
  service_role_arn = "arn:aws:iam::123456789012:role/codebuild-role"
  source_location  = "https://github.com/user/repo"
  buildspec        = "buildspec.yml"

  env_variables = [
    {
      name  = "ENV"
      value = "dev"
    }
  ]
}
