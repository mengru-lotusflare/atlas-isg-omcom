module "aurora_module_dno" {
  source = "globe.pe.jfrog.io/hmd-terraform-local-dev__NSKB-1194/aws-rds-aurora-mysql/aws"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment,
    aws.route53     = aws.route53,
    aws.instance_scheduler = aws.instance_scheduler
  }
  engine_version          = "8.0"
  instance_class          = "db.t4g.medium"
  name                    = "dno-portal"
#   parameter_group_name    = "aurora-mysql8.0"

  use_default_schedule      = false
  #Stop instances from 12midnight - 5:59AM (Mon-Sat)
  instance_scheduler_period = [
    {
        period_name = "start-6am-mon"
        description = "This period will start instances at 6 AM and stop at 11:59 PM on Monday"
        begintime   = "06:00"
        endtime     = "23:59"
        weekdays    = ["mon"]
    },
    {
        period_name = "start-6am-tue"
        description = "This period will start instances at 6 AM and stop at 11:59 PM on Tuesday"
        begintime   = "06:00"
        endtime     = "23:59"
        weekdays    = ["tue"]
    },
    {
        period_name = "start-6am-wed"
        description = "This period will start instances at 6 AM and stop at 11:59 PM on Wednesday"
        begintime   = "06:00"
        endtime     = "23:59"
        weekdays    = ["wed"]
    },
    {
        period_name = "start-6am-thu"
        description = "This period will start instances at 6 AM and stop at 11:59 PM on Thursday"
        begintime   = "06:00"
        endtime     = "23:59"
        weekdays    = ["thu"]
    },
    {
        period_name = "start-6am-fri"
        description = "This period will start instances at 6 AM and stop at 11:59 PM on Thursday"
        begintime   = "06:00"
        endtime     = "23:59"
        weekdays    = ["fri"]
    },
    {
        period_name = "start-6am-sat"
        description = "This period will start instances at 6 AM and stop at 11:59 PM on Saturday"
        begintime   = "06:00"
        endtime     = "23:59"
        weekdays    = ["sat"]
    }
  ]

        add_stop_tag            = true
        add_start_tag           = true

instance_parameters = [
    # {
    #   "name": "validate-password",
    #   "value": "FORCE-PLUS-PERMANENT"
    # },
    # {
    #   "name": "validate-password-length",
    #   "value": "15"
    # }
]
}
