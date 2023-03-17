terraform {
  backend "s3" {
    bucket = "terrafom-demo-state"
    key    = "ecsconfig/dev/terraform.tfstate"
    region = "us-east-2"
    
  }
}
