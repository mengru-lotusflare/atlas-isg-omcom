module "ec2_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-ec2/aws"

  providers = {
    aws.environment = aws.environment
    aws.security    = aws.security
    aws.route53     = aws.route53
  }

  name = "ec2"
  is_public = false

  # uses workload AMI
  ami = {
    name = "app1" # ami name as defined in projects
    build = "1"
    type = "al2"
  }

  #Path to zip file containing application deployment folder
  deployment_package_zip_path = "${path.root}/app.zip"

  #List of file paths to pipe logs to CloudWatch
  log_file_paths = [
        "/var/omcom/app.log",
        "/var/omcom/error.log"
  ]

  # Specify if you want to use spot instance in launch template. If dont want to use spot instance skip this block.  
  
 #  max_price - The maximum hourly price you're willing to pay for the Spot Instances.
 
  #instance_market_options = [
  #{
  # market_type = "spot"
  #  spot_options = [
  #    {
  #      max_price = 0.02
  #    }
  #  ]
  #}
#]

}
