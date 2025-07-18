Proyek ini adalah solusi **Infrastructure-as-Code (IaC)** untuk membangun pipeline CI/CD modern di AWS, menggunakan:

- **Amazon ECS (Fargate)** untuk menjalankan container
- **AWS CodeBuild** untuk membangun source code
- **AWS CodePipeline** untuk orkestrasi CI/CD
- **VPC** custom dengan public/private subnet
- **Modular Terraform**, reusable & aman

---

## 🧱 Struktur Proyek

```bash
aws-devsecops-infra/
├── modules/
│   ├── vpc/
│   ├── ecs/
│   ├── codebuild/
│   └── codepipeline/
├── environments/
│   └── dev/
├── diagram/
│   └── architecture.png
├── secrets/
│   └── credentials.tfvars (opsional)


🚀 Cara Deploy (Step-by-Step)
1️⃣ Konfigurasi AWS CLI
    aws configure
    # Masukkan Access Key dan Secret Key

2️⃣ Inisialisasi Terraform
    cd environments/dev
    terraform init

3️⃣ Rencanakan Infrastuktur
    terraform plan

4️⃣ Deploy ke AWS
    terraform apply

🧩 Diagram Arsitektur
Lihat di diagram/architecture.png

📌 Asumsi dan Batasan
    - IAM Role & Bucket harus sudah tersedia atau didefinisikan sendiri
    - Pipeline GitHub masih pakai Version 1 (sesuai instruksi soal)

🛡️ Keamanan & Best Practice
    - Reusable modules
    - Variable validation
    - Least privilege IAM (disarankan di real use-case)