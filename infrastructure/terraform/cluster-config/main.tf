provider "aws" {
    region = "us-east-1"
    
}

module "cluster_config" {
    source = "../modules/ecs-cluster"
    cluster_name = var.cluster_name

  
}