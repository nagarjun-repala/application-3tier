terraform {
  backend "s3" {
    bucket = "terrafom-demo-state"
    key    = "vpc/dev/terraform.tfstate"
    region = "us-east-2"
    
  }
}
