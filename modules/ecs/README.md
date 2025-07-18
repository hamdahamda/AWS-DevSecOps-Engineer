# ECS Terraform Module

Modul ini membuat konfigurasi Amazon ECS berbasis Fargate untuk menjalankan container aplikasi Anda.

## 📦 Resource yang Dibuat

- ECS Cluster
- ECS Task Definition
- ECS Service
- Network Configuration (via input subnet & SG)

## 🔧 Input Variables

| Nama                  | Deskripsi                                |
|-----------------------|-------------------------------------------|
| `project_name`        | Nama unik proyek                          |
| `cpu`                 | Alokasi CPU task ECS (misal: `256`)       |
| `memory`              | Alokasi memory ECS task (misal: `512`)    |
| `container_name`      | Nama container (misal: `myapp`)           |
| `container_image`     | Docker image (misal: dari ECR)            |
| `container_port`      | Port aplikasi (default: `80`)             |
| `execution_role_arn`  | IAM role ARN untuk ECS task               |
| `subnet_ids`          | List subnet ID (minimal 1)                |
| `security_group_ids`  | List security group ID                    |
| `desired_count`       | Jumlah instance task yang ingin dijalankan|

## 📤 Output

| Nama Output     | Deskripsi                  |
|------------------|-----------------------------|
| `cluster_id`     | ID ECS Cluster              |
| `service_name`   | Nama ECS service            |

## 🚀 Contoh Penggunaan

```hcl
module "ecs" {
  source               = "../../modules/ecs"
  project_name         = "myapp"
  container_name       = "myapp"
  container_image      = "my-ecr-image-url"
  execution_role_arn   = "arn:aws:iam::123456789012:role/ecs-task-role"
  subnet_ids           = [module.vpc.public_subnet_id]
  security_group_ids   = [aws_security_group.app_sg.id]
}
