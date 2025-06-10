#added during confluent topic pipeline
variable "app_env" {
    description = "App Environment"
    type = string
}

#added during secrets pipeline
variable "app_secrets" {
    description = "App Secrets"
    type = string
}

#S3
variable "s3_com1" {
    description = "Name for s3"
    type = string
}

variable "s3_com2" {
    description = "Name for s3"
    type = string
}

variable "s3_com3" {
    description = "Name for s3"
    type = string
}

variable "s3_com4" {
    description = "Name for s3"
    type = string
}

variable "s3_com5" {
    description = "Name for s3"
    type = string
}

variable "s3_com6" {
    description = "Name for s3"
    type = string
}

variable "s3_com7" {
    description = "Name for s3"
    type = string
}

variable "s3_com8" {
    description = "Name for s3"
    type = string
}

#ELASTICACHE VALKEY
variable "valkey" {
    description = "Name for Elasticache Valkey"
    type = string
}

#Keyspaces
variable "keyspaces" {
    description = "Name for Keyspaces"
    type = string
}

#Aurora DB MySQL
variable "aurora_module_dno" {
    description = "Name for Aurora DB MySQL"
    type = string
}

#Aurora Postgresql
variable "aurora_module_petal" {
    description = "Name for Aurora Postgresql"
    type = string
}