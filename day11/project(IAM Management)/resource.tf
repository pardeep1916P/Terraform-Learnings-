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
  #to avoid unwanted destroies when changes made
  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
}

#attach policies to user
resource "aws_iam_user_policy_attachment" "user_policy" {
  depends_on = [aws_iam_user.users]
  for_each   = { for pair in local.user_role_pair : "${pair.username}-${pair.role}" => pair }
  user       = aws_iam_user.users[each.value.username].name
  policy_arn   = "arn:aws:iam::aws:policy/${each.value.role}"

}



