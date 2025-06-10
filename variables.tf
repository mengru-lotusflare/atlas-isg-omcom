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
