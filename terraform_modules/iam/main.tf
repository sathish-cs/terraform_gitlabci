resource "aws_iam_user" "iam" {
  name = var.name
  path = var.path
  tags = var.tags
}

resource "aws_iam_access_key" "iam" {
  user = aws_iam_user.iam.name
}

output "iam_user_name" {
  value = aws_iam_user.iam.name
}

output "iam_access_key_id" {
  value = aws_iam_access_key.iam.id
}

output "iam_secret_access_key" {
  value = aws_iam_access_key.iam.secret
  sensitive = true
}
