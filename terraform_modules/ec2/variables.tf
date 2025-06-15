variable "ami_id" {
  description = "AMI for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance"
  type        = string
}

variable "key_name" {
  description = "SSH key to access Ec2 instance"
  type        = string
}

variable "name" {
  description = "Tag name for the instance"
  type        = string
}

variable "environment" {
  description = "tags"
  type        = string
}
