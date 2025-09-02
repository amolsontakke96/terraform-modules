output "public_subnet_id_1a" {
    value = aws_subnet.T-rex-public-subnet-1a.id
  
}

output "public_subnet_id_1b" {
    value = aws_subnet.T-rex-public-subnet-1b.id
  
}

output "private_subnet_id_1a" {
    value = aws_subnet.T-rex-private-subnet-1a.id
  
}

output "private_subnet_id_1b" {
    value = aws_subnet.T-rex-private-subnet-1b.id
  
}

output "security_group_id" {
    value = aws_security_group.T-rex-sg.id
}
