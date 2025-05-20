module "keyspaces" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-keyspaces/aws"

  providers = {
    aws.security    = aws.security,
    aws.environment = aws.environment
  }

  name       = "comkeyspace"

  replication_specification = {
    replication_strategy = "SINGLE_REGION"
  }

  keyspaces_tables = [
    {
      table_name = "allattributes"
      capacity_specification = {
        read_capacity_units  = 1
        write_capacity_units = 1
        throughput_mode      = "PROVISIONED"
      }
      client_side_timestamps_status = "ENABLED"
      comment_message               = "Table with all the keyspaces_tables variable attibutes used"
      default_time_to_live          = 60
      point_in_time_recovery_status = "ENABLED"
      columns = [
        { 
          name = "name", 
          type = "text" 
        }/*,
        { 
          name = "id",
          type = "uuid" 
        },
        {
          name = "address"
          type = "text"
        },*/
      ]
      partition_keys = [
        { 
          name = "name"
        }
      ]
      clustering_keys = [
        { 
          name = "name", 
          order_by = "ASC" 
        }
      ]
      static_columns = [
        {
          name = "name"
        }
      ]
      ttl_status = "ENABLED"
      keyspaces_table_tags = {
        Environment = "dev"
        Owner       = "teamA"
      }
    }/*,
    {
      table_name = "requiredonly"
      columns = [
        {
          name = "column1"
          type = "text"
        },
        {
          name = "column2"
          type = "blob"
        },
        {
          name = "column3"
          type = "decimal"
        },
        {
          name = "column4"
          type = "bigint"
        }
      ]
      partition_keys = [
        {
          name = "column1"
        },
        {
          name = "column2"
        }
      ]
      clustering_keys = [
        {
          name = "column3"
          order_by = "ASC"
        }
      ]
      static_columns = [
        {
          name = "column4"
        }
      ]
    },
    {
      table_name = "requirednoclusteringstatic"
      columns = [
        {
          name = "column1"
          type = "text"
        },
        {
          name = "column2"
          type = "blob"
        },
        {
          name = "column3"
          type = "decimal"
        },
        {
          name = "column4"
          type = "bigint"
        }
      ]
      partition_keys = [
        {
          name = "column1"
        },
        {
          name = "column2"
        }
      ]
    }*/
  ]
}
