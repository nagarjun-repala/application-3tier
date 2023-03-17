terraform {
  backend "s3" {
    bucket = "terrafom-demo-state"
    key    = "frontend/dev/terraform.tfstate"
    region = "us-east-2"
    
  }
}
