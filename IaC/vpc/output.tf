output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.this[*].id
}

output "vpc_security_group_ids" {
  value = aws_vpc.this.default_security_group_id
}