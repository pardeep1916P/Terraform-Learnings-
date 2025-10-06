#creating users
resource "aws_iam_user" "users" {
  depends_on = [local.users_data, local.user_role_pair]
  for_each   = toset(local.users_data[*].username)
  name       = each.value
}

#create password
resource "aws_iam_user_login_profile" "profile" {
  depends_on              = [aws_iam_user.users]
  for_each                = aws_iam_user.users
  user                    = each.value.name
  password_length         = 12
  password_reset_required = true
  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
}




