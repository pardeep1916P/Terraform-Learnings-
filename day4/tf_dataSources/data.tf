data "aws_caller_identity" "uname" {}
data "aws_region" "current" {}
data "aws_availability_zones" "available" {
    state = "available"
}
data "aws_lambda_functions" "serverless_apis" {
}
data "aws_apigatewayv2_apis" "apis" {
  protocol_type = "HTTP"
}
data "aws_iam_users" "names" {
    depends_on = [data.aws_caller_identity.uname]
    provider = aws.iam

}