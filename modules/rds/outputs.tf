output "cluster_endpoint" {
  value = aws_rds_cluster.aurora_mysql.endpoint
}

output "cluster_id" {
  value = aws_rds_cluster.aurora_mysql.id
}

output "rds_securitygroup_aurora_id" {
  description = "Security group ID for the RDS"
  value       = aws_security_group.rds_sg.id
}

# output "reader_endpoint" {
#   value = aws_rds_cluster.aurora.reader_endpoint
# }