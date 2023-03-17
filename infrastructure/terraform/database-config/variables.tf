variable "identifier_name" {
    type = string
    default = "mysql-db"
}

variable "db_name" {
    type        = string
    description = "db name"
    sensitive   = true
    default = "userdata"
}

variable "db_user" {
    type        = string
    description = "db username"
    sensitive   = true
    default = "admin"

}

variable "db_password" {
    type        = string
    description = "db password"
    default = "admin123456"
    sensitive   = true

}

variable "engine_version" {
    type= string
    description = "Engine version"
    default = "8.0.23"
}

variable "instance_class" {
    type = string
    description="Storage class for the DB"
    default = "db.t2.micro"
}

variable "storage_type" {
    type = string
    description="Storage type for DB"
    default = "gp2"
  
}

variable "storage" {
    type = string
    description = "Storage for DB"
    default = "20"
}

variable "public_access" {
    type = bool
    description = "public access"
    default = true
}

variable "skip_final_snapshot" {
    type= string
    description = "Checks whether the snapshot is created or not hile deleting the DB instance"
    default = true
  
}

variable "provisioner" {
    type = string
    description = "provisioner"
    default = "terraform"
}

variable "environment" {
    type = string
    description = "environemt"
    default = "dev"
}