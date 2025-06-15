module "web02" {
  source        = "git::http://20.56.28.3/root/terraform_modules.git//ec2?ref=main"
  ami_id        = var.web2_ami
  instance_type = var.web2_type
  subnet_id     = var.web2_subnet 
  key_name      = var.web2_key_name 
  name          = var.web2_name
  environment   = var.web2_env
}
