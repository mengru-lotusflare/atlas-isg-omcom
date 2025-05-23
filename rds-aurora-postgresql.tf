module "aurora_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local-dev__NSKB-1297/aws-rds-aurora-postgresql/aws"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment,
    aws.route53     = aws.route53,
    aws.instance_scheduler = aws.instance_scheduler
  }

  name               = "globe-com-petal-dev"
  instance_class     = "db.r6g.large"
  engine_version     = "16.9"
  parameter_group_name = "aurora-postgresql16"
  database_name = "dno-petal-database-dev"
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
  
   instance_parameters = [
    {
      "ParameterName": "validate_password_length",
      "ParameterValue": "15",
      "Description": "The minimum number of characters that validate_password requires passwords to have.",
      "Source": "user",
      "ApplyType": "dynamic",
      "DataType": "integer",
      "AllowedValues": "0-2147483647",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    },
    {
      "ParameterName": "log_connections",
      "ParameterValue": "1",
      "Description": "Logs each successful connection.",
      "Source": "user",
      "ApplyType": "dynamic",
      "DataType": "boolean",
      "AllowedValues": "0,1",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    },
    {
      "ParameterName": "log_disconnections",
      "ParameterValue": "1",
      "Description": "Logs end of a session, including duration.",
      "Source": "user",
      "ApplyType": "dynamic",
      "DataType": "boolean",
      "AllowedValues": "0,1",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    },
    {
      "ParameterName": "log_error_verbosity",
      "ParameterValue": "verbose",
      "Description": "Sets the verbosity of logged messages.",
      "Source": "user",
      "ApplyType": "dynamic",
      "DataType": "string",
      "AllowedValues": "terse,default,verbose",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    },
    {
      "ParameterName": "pgaudit.log",
      "ParameterValue": "all",
      "Description": "Specifies which classes of statements will be logged by session audit logging.",
      "Source": "user",
      "ApplyType": "dynamic",
      "DataType": "list",
      "AllowedValues": "ddl,function,misc,read,role,write,none,all,-ddl,-function,-misc,-read,-role,-write",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    },
    {
      "ParameterName": "pgaudit.role",
      "ParameterValue": "rds_pgaudit",
      "Description": "Specifies the master role to use for object audit logging.",
      "Source": "user",
      "ApplyType": "dynamic",
      "DataType": "string",
      "AllowedValues": "rds_pgaudit",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    },
    {
      "ParameterName": "shared_preload_libraries",
      "ParameterValue": "pgaudit,pg_stat_statements",
      "Description": "Lists shared libraries to preload into server.",
      "Source": "user",
      "ApplyType": "static",
      "DataType": "list",
      "AllowedValues": "auto_explain,orafce,pgaudit,pglogical,pg_bigm,pg_cron,pg_hint_plan,pg_prewarm,pg_similarity,pg_stat_statements,pg_tle,pg_transport,plprofiler,plrust",
      "IsModifiable": true,
      "ApplyMethod": "pending-reboot"
    }
  ]

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
