module "alb_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-alb/aws" # Source path of the module(Do not change this).
  version = "1.0.4"  #This is version of the module. Refer CHANGELOG.md for versions.

  providers = {
    aws.route53     = aws.route53
    aws.environment = aws.environment
    aws.security    = aws.security
  }

  name              = "alb"
  alb_subnet_type   = "alb"
  listener_configurations = [
    {
      port_number        = 443
      protocol           = "HTTPS"
      target_group_name  = "TG1"
      allow_ingress_from = [""]
    }
  ]
  target_group_configurations = [
    {
        target_group_name     = "tgn1"
        port     = 7890
        target_type = "ip"
        protocol = "HTTPS"
        stickiness = {
            cookie_enabled  = true
            cookie_duration = 60
            type            = "lb_cookie"
        }
        target_id = "10.220.193.70"
    }
  ]
  additional_target_group_attachment = [
    {
        map_key            = "additional1"
        target_group_name  = ""
        target_id          = "192.168.1.41"
        availability_zone  = "all"
        port               = 9103
    }
  ]
}
