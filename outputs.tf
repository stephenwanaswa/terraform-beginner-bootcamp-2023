output "bucket_name" {
  description = "Bucket name for our static website hosting"
  value = module.home_medievil_hosting.bucket_name
}

output "s3_website_endpoint" {
  description = "S3 Static Website hosting endpoint URL"
  value = module.home_medievil_hosting.website_endpoint
}

output "domain_name" {
  description = "Medievil Domain Name"
  value = module.home_medievil_hosting.domain_name
}