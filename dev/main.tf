module "iam" {
  source = "git::http://<your_ip>/root/terraform_modules.git//iam?ref=main"
  name = var.iam_name
  path = "/dev/"
  tags = {
    Environment = "dev"
    Owner       = "devops"
  }
}



variable "iam_name" {
  description = "IAM user name"
  type        = string
  default = "sattest"
}
