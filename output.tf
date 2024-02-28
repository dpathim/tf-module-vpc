output "subnets" {
  value = module.subnets
}

output "vpc_id" {
  value = "aws_vpc.main.id"

}

output "public_subnet_ids" {
  value = "local.public_subnet_ids"
}