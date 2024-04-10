output "vpc_arn" {
  value = aws_vpc.this.arn
}

output "vpc_internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "vpc_nat_gateway_id" {
  value = aws_nat_gateway.this.id
}

output "vpc_public_subnets_id" {
  value = aws_subnet.publics[*].id
}

output "vpc_private_subnets_id" {
  value = aws_subnet.privates[*].id
}

output "ec2_eip_address" {
  value = aws_eip.this.public_ip
}

output "endpoint" {
  value = aws_eks_cluster.this.endpoint
}