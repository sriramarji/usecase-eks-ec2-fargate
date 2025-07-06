# EKS Cluster Outputs
output "cluster_id" {
  description = "id of the EKS cluster."
  value       = aws_eks_cluster.eks.id
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks.name
}

output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = aws_eks_cluster.eks.arn
}

output "eks_cluster_endpoint" {
  description = "The endpoint for the EKS cluster"
  value       = aws_eks_cluster.eks.endpoint
}

output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = aws_eks_cluster.eks.version
}

# output "eks_cluster_role_arn" {
#   description = "The ARN of the IAM role used by the EKS cluster"
#   value       = aws_iam_role.this.arn
# }

output "node_group_name" {
  description = "The name of the managed node group"
  value       = aws_eks_node_group.node_group.node_group_name
}

# output "node_group_role_arn" {
#   description = "The ARN of the IAM role used by the node group"
#   value       = aws_iam_role.node.arn
# }

output "aws_iam_openid_connect_provider_arn" {
  description = "AWS IAM Open ID Connect Provider ARN"
  value       = aws_iam_openid_connect_provider.oidc_provider.arn
}

output "aws_iam_openid_connect_provider_extract_from_arn" {
  description = "AWS IAM Open ID Connect Provider extract from ARN"
  value       = local.aws_iam_oidc_connect_provider_extract_from_arn
}

output "eks_security_group_id" {
  description = "Security group ID for the Application Load Balancer"
  value       = aws_security_group.eks.id
}

output "cluster_certificate_authority_data" {
  description = "Nested attribute containing certificate-authority-data for your cluster. This is the base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.eks.certificate_authority[0].data
}