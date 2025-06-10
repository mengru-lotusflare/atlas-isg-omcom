module "confluent" {
  source  = "globe.pe.jfrog.io/hmd-terraform-local__service/confluent-topic/aws"
  version = "~>2.0.0"

  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
  }

  cluster_name = "com"

  topic_schema_map = [
    {
      topic_name    = "com_test"
      schema_format = "json"
      schema_file   = "./schemas/json/${var.app_env}/com_test.json"
    }
  ]
}
