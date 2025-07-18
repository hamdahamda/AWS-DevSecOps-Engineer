variable "project_name" {}
variable "cpu" { default = "256" }
variable "memory" { default = "512" }
variable "container_name" {}
variable "container_image" {}
variable "container_port" { default = 80 }
variable "execution_role_arn" {}
variable "subnet_ids" {
  type = list(string)
}
variable "security_group_ids" {
  type = list(string)
}
variable "desired_count" {
  default = 1
}
