variable "region" {
  default = "eu-west-1"
}

variable "project_name" {}

variable "environments" {
  type = map(object({
  }))
}

variable "pg_instance_class" {
  default = "db.t2.micro"
}

variable "pg_username" {
  default = "postgres_user"
}

variable "vpc_cidr" {
  default = "192.168.0.0/16"
}

variable "public_subnet_a_cidr" {
  default = "192.168.1.0/24"
}

variable "public_subnet_b_cidr" {
  default = "192.168.2.0/24"
}

variable "public_subnet_c_cidr" {
  default = "192.168.3.0/24"
}

variable "private_subnet_a_cidr" {
  default = "192.168.11.0/24"
}

variable "private_subnet_b_cidr" {
  default = "192.168.12.0/24"
}

variable "private_subnet_c_cidr" {
  default = "192.168.13.0/24"
}
