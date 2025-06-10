module "ec2_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-ec2/aws"

  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
    aws.route53     = aws.route53
  }
  name = "ec2"
  is_public = false
  instance_type  = var.instance_type5
  subnet_type = var.ec2_subnet_type
  ami = var.ami5
  custom_ami_owner = var.custom_ami_owner
  launch_script_path = var.launch_script_path
  private_ip_address = var.private_ip_address["node5"]
  ec2_subnet_name = var.ec2_subnet_name["sub2"]
  deployment_package_zip_path = var.deployment_package_zip_path
  security_configurations = var.security_configurations
  log_file_paths = var.log_file_paths
}
