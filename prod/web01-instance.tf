 module "web01" {
   source        = "git::http://20.56.28.3/root/terraform_modules.git//ec2?ref=main"
   ami_id        = var.web1_ami
   instance_type = var.web1_type
   subnet_id     = var.web1_subnet 
   key_name      = var.web1_key_name 
   name          = var.web1_name
   environment   = var.web1_env
 }
