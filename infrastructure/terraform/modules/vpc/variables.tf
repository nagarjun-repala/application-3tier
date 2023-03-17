variable "vpc_cidr_block" {
    type = string
    description= "VPC CIDR block"
  
}

variable "vpc_name" {
    type = string
    description = "Name of the VPC"
  
}

variable "cidr_public_subnet_az1" {
    type = string
    description = "CIDR for public subnet 1"
  
}
variable "cidr_public_subnet_az2" {
    type = string
    description = "CIDR for public subnet az 2"
  
}

variable "cidr_private_subnet_az1" {
    type = string
    description = "CIDR for private subnet az 1"
  
}
variable "cidr_private_subnet_az2" {
    type = string
    description = "CIDR for private subnet az 2"
  
}

variable "environment" {
    type = string
    description = "Environment"
}

variable "provisioner" {
    type = string
    default = "terraform"
}
