module "ec2_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-ec2-basic/aws"
  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
    aws.route53     = aws.route53
  }
  name = var.name1
  is_public = false
  instance_type  = var.instance_type
  subnet_type = var.ec2_subnet_type
  ami = var.ami
  custom_ami_owner = var.custom_ami_owner
  private_ip_address = var.private_ip_address["node1"]
  ec2_subnet_name = var.ec2_subnet_name["sub1"]
  deployment_package_zip_path = var.deployment_package_zip_path
  log_file_paths = var.log_file_paths

} 
