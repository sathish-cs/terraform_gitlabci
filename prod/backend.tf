terraform {
  backend "s3" {
    bucket         = "your_bucket_name"
    key            = "prod/terraform.tfstate" 
    region         = "eu-central-1" #replace to your region
  }
}
