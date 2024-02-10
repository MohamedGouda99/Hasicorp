output "instance_type" {
  value = module.server_subnet_1.size
}
output "public_ip" {
  value = module.server_subnet_1.public_ip
}
output "public_dns" {
  value = module.server_subnet_1.public_dns
}
output "data-bucket-arn" {
  value = data.aws_s3_bucket.bk.arn
}
output "data-bucket-domain-name" {
  value = data.aws_s3_bucket.bk.bucket_domain_name
}
output "data-bucket-region" {
  value = "the ${data.aws_s3_bucket.bk.id} exists in ${data.aws_s3_bucket.bk.region}"
}
output "max_value" {
  value = local.maximum
}

output "min_value" {
  value = local.minimum
}

output "description" {
  value = local.common_tags.Name
}
