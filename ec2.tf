module "ec2_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-ec2-basic/aws"
  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
    aws.route53     = aws.route53
  }
  name = "ec2"
  is_public = false
  instance_type  = "t3.large"
  subnet_type = "ec2"

  ami = {
  is_soe = false
  name = "10.220.146.192/28"
  build = 49
  }

  custom_ami_owner = "337994588368"
  private_ip_address = 10.220.146.192/28
  ec2_subnet_name = "EC2-PRI-AZA-DEV-COM-SUB03"
  deployment_package_zip_path = null
  log_file_paths = []

} 
