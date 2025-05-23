module "aurora_module_petal" {
  source = "globe.pe.jfrog.io/hmd-terraform-local-dev__NSKB-1297/aws-rds-aurora-postgresql/aws"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment,
    aws.route53     = aws.route53,
    aws.instance_scheduler = aws.instance_scheduler
  }

  name               = "globe-petal"
  instance_class     = "db.r6g.large"
  engine_version     = "16.4"
  # parameter_group_name = "aurora-postgresql16"
  database_name = "dnopetal"
  /*allow_ingress_from = []

  enable_alarms = [
    "CPUUtilization", "FreeableMemory", "DatabaseConnections", "RDSToAuroraPostgreSQLReplicaLag", "ReadIOPS",
    "WriteIOPS", "SnapshotStorageUsed", "SwapUsage"
  ]
  aurora_cpu_threshold                   = 70 #percent
  aurora_memory_threshold                = 3758096384 #in bytes, 3.5gb
  aurora_databaseconnection_threshold    = 10 #number of database connection
  aurora_replica_lag_threshold           = 120 #seconds
  aurora_read_iops_threshold             = 10 #readiops count per sec
  aurora_write_iops_threshold            = 10 #write iops count per sec
  aurora_snapshot_storage_used_threshold = 3758096384 #in bytes, 3.5gb
  cloudwatch_metric_period               = 60 #seconds
  allow_iam_read                         = ["prn::srcd2-showcase-sit-rt-role", "srcd2-showcase-sit-ingress-role"]
  number_of_read_replicas                = 1 # Max 3 allowed
  cluster_parameters                     = [
    {
      name  = "application_name"
      value = "aurpsql-hscl"
    },
    {
      name  = "rds.log_retention_period"
      value = "5400"
    }
  ]
  instance_parameters = [
    {
      name  = "application_name"
      value = "aurpsql-instance"
    }
  ]*/
  
   #instance_parameters = [
    # {
    #   "apply_method": "immediate",
    #   "name": "validate_password_length",
    #   "value": "15"
    # },
    # {
    #   "apply_method": "immediate",
    #   "name": "log_connections",
    #   "value": "1"
    # },
    # {
    #   "apply_method": "immediate",
    #   "name": "log_disconnections",
    #   "value": "1"
    # },
    # {
    #   "apply_method": "immediate",
    #   "name": "log_error_verbosity",
    #   "value": "verbose"
    # },
    # {
    #   "apply_method": "immediate",
    #   "name": "pgaudit.log",
    #   "value": "all"
    # },
    # {
    #   "apply_method": "immediate",
    #   "name": "pgaudit.role",
    #   "value": "rds_pgaudit"
    # },
    # {
    #   "apply_method": "pending-reboot",
    #   "name": "shared_preload_libraries",
    #   "value": "pgaudit,pg_stat_statements"
    # }
  #]

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
}
