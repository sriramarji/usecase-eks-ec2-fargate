variable "vpc_cidr_block" {
  description = "value"
  type        = string
  default     = "192.168.0.0/16"
}

variable "name" {
  description = "value"
  type        = string
  default     = "test"
}

# EKS OIDC ROOT CA Thumbprint - valid until 2037
variable "eks_oidc_root_ca_thumbprint" {
  type        = string
  description = "Thumbprint of Root CA for EKS OIDC"
  default     = "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
}

variable "subnet-group-name" {
  description = "Name of subnet group name"
  type        = string
  default     = "aurora-subnet-group"
}

variable "engine" {
  description = "Engine name"
  type        = string
  default     = "aurora-mysql"
}

variable "db_username" {
  description = "database username"
  type        = string
  default     = "admin"
}

variable "db_name" {
  description = "database name"
  type        = string
  default     = "test"
}

variable "region" {
  description = "provide your region"
  type        = string
  default     = "us-east-1"
}