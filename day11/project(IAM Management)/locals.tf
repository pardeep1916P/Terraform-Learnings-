locals {
  #read and save users data from yaml file
  users_data = yamldecode(file("./users.yaml")).users
  #create a list of maps containing username and role pairs
  user_role_pair = flatten([for user in local.users_data : [for role in user.roles : {
    username = user.username
    role     = role
  }]])
}
