module "s3_module_reports" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "reports" # component_name

  /*allow_iam_read = []
  allow_iam_write = []
  allow_iam_admin = []
  cross_replication_from = [
    {
      accountID = "741553940416" #source AWS accountID
      rolename = "s3crr_role_for_samplebucket" #source IAM role used in replication configuration
    }
  ]

  cors_rule_configuration = [
    {
      allowed_headers = ["Authorization"]
      allowed_methods = ["GET"]
      allowed_origins = ["https://example1.com"]
      expose_headers  = ["ETag"]
      max_age_seconds = 3600
    },
    {
      allowed_headers = ["Authorization"]
      allowed_methods = ["POST", "PUT"]
      allowed_origins = ["https://example2.com"]
      expose_headers  = ["ETag"]
      max_age_seconds = 4000
    },
    {
      allowed_methods = ["POST", "PUT"]
      allowed_origins = ["https://example3.com"]
    }
    # Add more CORS rules if needed
  ]
      
  lifecycle_rules = [
    {
      id      = "test-transition-class2"
      enabled = true
      transition = [{
        storage_class = "STANDARD_IA"
        days = 31
      }]
    },
    {
      id      = "test-all-blocks"
      enabled = true
      abort_incomplete_multipart_upload = {
        days_after_initiation = 26
      }
      expiration = {
          expired_object_delete_marker = true
      }
      filter = {
        prefix = "test"
      }
      noncurrent_version_expiration = {
        noncurrent_days = 111
        newer_noncurrent_versions = 36
      }
      noncurrent_version_transition = [{
        storage_class = "STANDARD_IA"
        noncurrent_days = 30
      },
      {
        storage_class = "ONEZONE_IA"
        noncurrent_days = 60
      },
      {
        storage_class = "GLACIER"
        noncurrent_days = 100
      }
      ]
      transition = [{
        storage_class = "STANDARD_IA"
        days = 30
      },
      {
        storage_class = "ONEZONE_IA"
        days = 60
      },
      {
        storage_class = "GLACIER"
        days = 100
      }
      ]
    },
    {
      id      = "test-all-blocks-except-filter"
      enabled = false
      abort_incomplete_multipart_upload = {
        days_after_initiation = 26
      }
      expiration = {
          expired_object_delete_marker = true
      }
      noncurrent_version_expiration = {
        noncurrent_days = 101
        newer_noncurrent_versions = 36
      }
      noncurrent_version_transition = [{
        storage_class = "STANDARD_IA"
        noncurrent_days = 30
      },
      {
        storage_class = "ONEZONE_IA"
        noncurrent_days = 60
      },
      {
        storage_class = "GLACIER"
        noncurrent_days = 100
      }
      ]
      transition = [{
        storage_class = "STANDARD_IA"
        days = 30
      },
      {
        storage_class = "ONEZONE_IA"
        days = 60
      },
      {
        storage_class = "GLACIER"
        days = 100
      }
      ]
    }
  ]*/
}


module "s3_module_documents" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "documents"

}

module "s3_module_billing-pdf" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "billing-pdf"

}

module "s3_module_redshift-da" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "redshift-da"

}

module "s3_module_data-import" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "data-import"

}

module "s3_module_polaris-file" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "polaris-file"

}

module "s3_module_creed-files" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "creed-files"

}

module "s3_module_attachments" {
  source = "globe.pe.jfrog.io/hmd-terraform-local__service/aws-s3/aws"

  providers = {
    aws.environment = aws.environment,
    aws.security    = aws.security,
    aws.dr          = aws.dr
    aws.security_dr = aws.security_dr
  }

  name = "attachments"

}