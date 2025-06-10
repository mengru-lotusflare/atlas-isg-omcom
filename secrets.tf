module "secrets_manager_app_secrets" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-secrets-manager/aws"

  version = "~>1.1.0"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment
  }

  name = var.app_secrets
}
