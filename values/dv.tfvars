####Ec2######
instance_type  = "t3.large"
ec2_subnet_type = "ec2"

deployment_package_zip_path = null
custom_ami_owner = "337994588368"
log_file_paths = []
ec2_subnet_name =  {
  sub1 = "EC2-PRI-AZA-DEV-COM-SUB03",
  sub2 = "EC2-PRI-AZB-DEV-COM-SUB04"
}


private_ip_address = {
  node1 = "10.220.146.192/28",
  node2 = "10.220.146.208/28"
}


##ValueEC2
name1 = "ec2"
instance_type  = "t2.micro"
ami = {
  is_soe = false
  name = "node"
  build = 49
  }

