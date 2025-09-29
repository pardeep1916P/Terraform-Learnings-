output "user_name" {
    value = regex("user/(.*)",data.aws_caller_identity.uname.arn)[0]
}

output "aws_region" {
  value = var.region
}

output "current_region" {
    value = data.aws_region.current.description
}

output "availability_zones" {
    value = data.aws_availability_zones.available.names
}

output "lambdas" {
    value = (data.aws_lambda_functions.serverless_apis.function_names)[0]
}

output "gateway" {
    value = data.aws_apigatewayv2_apis.apis.ids
}

output "userlist" {
  value = (data.aws_iam_users.names.names)
}