provider "aws" {
    region = "us-east-1"
    
}

module "database_config" {
    source = "../modules/rds"
    identifier_name = var.identifier_name
    db_name = var.db_name
    db_user = var.db_user
    db_password = var.db_password
    engine_version = var.engine_version
    instance_class = var.instance_class
    storage_type = var.storage_type
    storage = var.storage
    vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
    vpc_cidr = data.terraform_remote_state.vpc.outputs.vpc_cidr
    # webserver_sg_id = ""
    db_subnet_ids = [data.terraform_remote_state.vpc.outputs.public_subnet_az1, data.terraform_remote_state.vpc.outputs.public_subnet_az2]
    environment = var.environment
    public_access = var.public_access

  
}