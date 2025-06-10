module "elasticache_serverless_valkey_pooled" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-elasticache-serverless/aws"

  providers = {
    aws.route53     = aws.route53
    aws.environment = aws.environment
    aws.security    = aws.security
  }

  name = var.valkey_name
  engine = "valkey"
#   daily_snapshot_time  = "20:00" # It only support UTC and in a time format of HH:MM format (24-hour clock)
    major_engine_version = "8"
#   snapshot_retention_limit = 2 # This will enable Automatic backups

#   cache_usage_limits = {
#     data_storage = {
#       minimum = 1
#       maximum = 5
#     }
#     ecpu_per_second = {
#       minimum = 2000
#       maximum = 4000
#     }
#   }
    subnet_type = "redis"
}