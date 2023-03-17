output "vpc_id" {
    value = module.vpc_config.vpc_id
    description = "VPC ID"
}

output "private_subnet_az1" {
    value = module.vpc_config.private_subnet_az1
    description = "Private subnet id for az1"
  
}

output "private_subnet_az2" {
    value = module.vpc_config.private_subnet_az2
    description = "Private subnet id for az2"
  
}

output "public_subnet_az1" {
    value = module.vpc_config.public_subnet_az1
    description = "Public subnet id for az1"
  
}

output "public_subnet_az2" {
    value = module.vpc_config.public_subnet_az2
    description = "Public subnet id for az2"
  
}

output "vpc_cidr" {
     value = module.vpc_config.vpc_cidr
     description = "VPC CIDR"
}