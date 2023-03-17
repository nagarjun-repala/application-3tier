variable "identifier_name" {
    type = string
}
variable "db_name" {
    type        = string
    description = "db name"
    sensitive   = true
}

variable "db_user" {
    type        = string
    description = "db username"
    sensitive   = true

}

variable "db_password" {
    type        = string
    description = "db password"
    sensitive   = true

}

variable "engine_version" {
    type= string
    description = "Engine version"
}

variable "instance_class" {
    type = string
    description="Storage class for the DB"
}

variable "storage_type" {
    type = string
    description="Storage type for DB"
    default = "gp2"
  
}

variable "storage" {
    type = string
    description = "Storage for DB"
}

variable "vpc_id" {
    type = string
    description = "VPC ID"  
}

variable "vpc_cidr" {
    type = string
    description = "VPC ID"  
}
variable "public_access" {
    type = bool
    description = "public access"
  
}

# variable "webserver_sg_id" {
#     type = string
#     description = "Webserver security group id"
  
# }

variable "skip_final_snapshot" {
    type= string
    description = "Checks whether the snapshot is created or not hile deleting the DB instance"
    default = true
  
}

variable "db_subnet_ids" {
    type = list
    description = "Subnet ID's for DB to be deployed in"
  
}

variable "provisioner" {
    type = string
    description = "provisioner"
    default = "terraform"
}

variable "environment" {
    type = string
    description = "environemt"
}