output "vpc_id" {
  description = "ID dari VPC utama"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID dari subnet publik"
  value       = aws_subnet.public.id
}

output "private_subnet_id" {
  description = "ID dari subnet privat"
  value       = aws_subnet.private.id
}
