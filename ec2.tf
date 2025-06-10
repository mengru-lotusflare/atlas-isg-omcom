module "ec2_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-ec2/aws"

  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
    aws.route53     = aws.route53
  }
  name = "ec2"
  is_public = false
  ami = "app1"
  deployment_package_zip_path = var.deployment_package_zip_path
  log_file_paths = var.log_file_paths
}
