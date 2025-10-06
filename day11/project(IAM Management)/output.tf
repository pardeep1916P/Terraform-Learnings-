# output "users_data" {
#   value = local.users_data[*].username
# }

#display userdata and roles
output "user_role_pair" {
  value = local.user_role_pair
}
