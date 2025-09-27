# output "randomid"{
#     value = random_id.rid.hex
# }

output "url"{
    value = aws_s3_bucket_website_configuration.webapp-bucket.website_endpoint
}