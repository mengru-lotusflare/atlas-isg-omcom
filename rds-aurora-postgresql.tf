module "aurora_module" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-rds-aurora-postgresql/aws"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment,
    aws.route53     = aws.route53,
    aws.instance_scheduler = aws.instance_scheduler
  }

  name               = "postgresql"
  instance_class     = "db.t3.small"
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
}
