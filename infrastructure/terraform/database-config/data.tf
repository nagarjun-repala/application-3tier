data "terraform_remote_state" "vpc" {
    backend = "s3"
    config = {
        bucket = "terrafom-demo-state"
        key    = "vpc/dev/terraform.tfstate"
        region = "us-east-2"
              
    }
  
}