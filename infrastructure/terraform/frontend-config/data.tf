data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket = "terrafom-demo-state"
        key    = "vpc/dev/terraform.tfstate"
        region = "us-east-2"
              
    }
  
}

data "terraform_remote_state" "ecs_cluster" {
    backend = "s3"
    config = {
        bucket = "terrafom-demo-state"
        key    = "ecscluster/dev/terraform.tfstate"
        region = "us-east-2"
              
    }
  
}

data "terraform_remote_state" "database" {
    backend = "s3"
    config = {
        bucket = "terrafom-demo-state"
        key    = "database/dev/terraform.tfstate"
        region = "us-east-2"
              
    }
  
}