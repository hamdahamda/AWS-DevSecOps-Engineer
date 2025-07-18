# VPC Module

Modul ini membuat satu VPC sederhana dengan:
- 1 public subnet
- 1 private subnet
- 1 Internet Gateway
- 1 Route Table

## Input Variables

| Name               | Description                        | Default        |
|--------------------|------------------------------------|----------------|
| `project_name`     | Nama proyek                        | -              |
| `vpc_cidr`         | CIDR block untuk VPC               | `10.0.0.0/16`  |
| `public_subnet_cidr` | CIDR untuk subnet publik         | `10.0.1.0/24`  |
| `private_subnet_cidr` | CIDR untuk subnet privat        | `10.0.2.0/24`  |
| `availability_zone` | AZ tempat subnet dibuat           | -              |

## Output

- `vpc_id`
- `public_subnet_id`
- `private_subnet_id`
