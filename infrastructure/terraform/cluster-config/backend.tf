terraform {
  backend "s3" {
    bucket = "terrafom-demo-state"
    key    = "ecscluster/dev/terraform.tfstate"
    region = "us-east-2"
    
  }
}
