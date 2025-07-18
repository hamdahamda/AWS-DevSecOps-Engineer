variable "project_name" {
  description = "Nama proyek untuk penamaan resource"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block untuk VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block untuk subnet publik"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block untuk subnet privat"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "AZ tempat subnet dibuat"
  type        = string
}
