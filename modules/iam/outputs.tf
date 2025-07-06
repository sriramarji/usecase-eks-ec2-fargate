output "lbc_iam_policy" {
  value = data.http.lbc_iam_policy.response_body
}

output "lbc_iam_role_arn" {
  description = "AWS Load Balancer Controller IAM Role ARN"
  value       = aws_iam_role.lbc_iam_role.arn
}

#################################################

output "lbc_iam_policy_arn" {
  value = aws_iam_policy.lbc_iam_policy.arn
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "fargate_profile_role_arn" {
  value = aws_iam_role.fargate_profile_role.arn
}

output "eks_role_depends_on" {
  value = aws_iam_role.eks_cluster_role
}

output "lbc_iam_depends_on" {
  value = aws_iam_role.lbc_iam_role
}