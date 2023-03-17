provider "aws" {
    region = "us-east-1"
    
}

module "vpc_config" {
    source = "../modules/vpc"
    vpc_cidr_block = var.vpc_cidr_block
    environment = var.environment
    vpc_name = var.vpc_name
    cidr_private_subnet_az1 = var.cidr_private_subnet_az1
    cidr_private_subnet_az2 = var.cidr_private_subnet_az2
    cidr_public_subnet_az1 = var.cidr_public_subnet_az1
    cidr_public_subnet_az2 = var.cidr_public_subnet_az2
  
}