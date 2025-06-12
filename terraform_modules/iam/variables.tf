variable "name" {
  description = "IAM username"
  type        = string
}

variable "path" {
  description = "Path for the IAM user"
  type        = string
  default     = "/"
}

variable "tags" {
  description = "Tags for the IAM user"
  type        = map(string)
  default     = {}
}
