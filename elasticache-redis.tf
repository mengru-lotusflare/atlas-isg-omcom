module "elasticache_module_cluster_redis" {
  source = "globe.pe.jfrog.io/hmd-terraform-local-dev__NSKB-1299/aws-elasticache-redis/aws"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment,
    aws.route53     = aws.route53
  }

  name                  = "redis"
  node_type             = "cache.m5.xlarge"
  /*cluster_mode_enabled  = true
  parameter_group_name  = "default.redis7"
  family                = "redis7"
  allow_ingress_from    = ["sa::app"]
  number_cache_clusters = 1 
  subnet_type           = "elasticcache" # Consult AWS tribe team before modifying this value. 

  maintenance_window = "sun:05:00-sun:09:00"  # Format: day:start-end
  
  parameters = [
   {
      name  = "notify-keyspace-events"
      value = "lK"
    }
 ]*/
}
