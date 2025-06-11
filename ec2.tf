module "ec2_standalone_module" {
  source  = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-ec2-basic/aws"
  version = "~>1.0.0"
  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
    aws.route53     = aws.route53
  }

  name = "ec2-cassandra" # Enter value

  # private_ip_address = "10.220.140.195"

  # uses workload AMI
#   ami = {
#     is_soe = false
#     name   = "nginx"
#     build  = 35 # Enter value
#   }

  #Allocate multiple security rules
  security_configurations = []

  is_public     = false
  subnet_type   = "ec2"
  instance_type = "t3.medium"

  #Option to add deployment.zip file for the Application Deployment
  deployment_package_zip_path = null

  #Addition of userdata script
#   launch_script_path = "./scripts/run-docker.sh"

  #List of file paths to pipe logs to CloudWatch
  log_file_paths = []
}
