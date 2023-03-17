terraform {
  backend "s3" {
    bucket = "terrafom-demo-state"
    key    = "database/dev/terraform.tfstate"
    region = "us-east-2"
    
  }
}
