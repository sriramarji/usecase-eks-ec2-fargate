variable "engine" {
  description = "value"
  type        = string
}

variable "db_username" {
  description = "value"
  type        = string
}

variable "subnet-group-name" {
  description = "value"
  type        = string
}

variable "db_name" {}

variable "private_subnets" {
  type = list(string)
}

variable "vpc_id" {
  description = "CIDR Range  to be used on VPC"
  type        = string
}


# variable "cluster_identifier" {
#     description = "value"
#     type = string 
# }

# variable "instance_count" {}

# variable "instance_class" {}

# variable "engine_version" {}

# variable "backup_retention_period" {}

# variable "subnets" {}

# variable "master_password" {}