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
      port_number        = ""
      protocol           = ""
      target_group_name  = ""
      allow_ingress_from = [""]
    }
#     {
#       port_number        = 80
#       protocol           = "HTTPS"
#       target_group_name  = "TG2"
#       allow_ingress_from = ["sa::intranet"]
#     },
#     {
#       port_number        = 443
#       protocol           = "HTTPS"
#       target_group_name  = "TG3"
#       allow_ingress_from = []
#     }
#   ]
#   target_group_tags = {
#   "my_key" = "my_value"
# }
#   target_group_configurations = [
#     {
#         target_group_name     = "TG1"
#         port     = 7890
#         target_type = "ip"
#         protocol = "HTTPS"
#         stickiness = {
#             cookie_enabled  = true
#             cookie_duration = 60
#             type            = "lb_cookie"
#         }
#         target_id = "var.target_ips"
#     },
#     {
#         target_group_name        = "TG2"
#         port        = 1111
#         target_type = "instance"
#         protocol    = "HTTPS"
#         health_check = {
#             enabled             = true   
#             path                = "/"    
#             response_code       = 200    
#             healthy_threshold   = 5      
#             unhealthy_threshold = 5     
#             timeout             = 10     
#             interval            = 20     
#             protocol            = "HTTPS"
#         }
#         stickiness = {
#             cookie_enabled  = true
#             cookie_duration = 60
#             type     = "lb_cookie"
#         }
#         target_id = "i-073a1977b86237ba7"
#     }
#   ]
#   additional_target_group_attachment = [
#     {
#         map_key            = "additional1"
#         target_group_name  = "TG3"
#         target_id          = "192.168.1.41"
#         availability_zone  = "all"
#         port               = 9103
#     },
#     {
#         map_key            = "additional2"
#         target_group_name  = "2"
#         target_id          = "192.168.1.42"
#         availability_zone  = "all"
#         port               = 9104
#     },
#     {
#         map_key            = "additional3"
#         target_group_name  = "1"
#         target_id          = "10.220.193.71"
#         port               = 7890
#     },
#     {
#         map_key            = "additional4"
#         target_group_name  = "2"
#         target_id          = "192.168.1.43"
#         availability_zone  = "all"
#         port               = 9105
#     },
#     {
#         map_key            = "additional5"
#         target_group_name  = "3"
#         target_id          = "i-084bfb8f894d58216"
#         port               = 1112
#     }
  ]
}
