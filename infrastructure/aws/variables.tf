variable "region" {
  default = "eu-west-1"
}

variable "account_id" {}

variable "project_name" {}

variable "environments" {
  type = map(object({
  }))
}
