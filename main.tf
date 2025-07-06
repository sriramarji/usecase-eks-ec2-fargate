module "vpc" {

  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  name           = var.name
}

module "eks" {
  source = "./modules/eks"

  name                        = var.name
  cluster_role_arn            = module.iam.eks_cluster_role_arn
  public_subnets              = module.vpc.public_subnets
  security_group_ids          = [module.eks.eks_security_group_id]
  cluster-role-dependency     = module.iam.eks_role_depends_on
  node_role_arn               = module.iam.eks_node_role_arn
  private_subnets             = module.vpc.private_subnets
  fargate_profile_role_arn    = module.iam.fargate_profile_role_arn
  namespace_depends_on        = module.helm.namespace_depends_on
  vpc_id                      = module.vpc.vpc_id
  namespace                   = module.helm.namespace
  eks_oidc_root_ca_thumbprint = var.eks_oidc_root_ca_thumbprint

  depends_on = [module.vpc]
}


module "ecr" {
  source = "./modules/ecr"
}

module "rds" {

  source = "./modules/rds"

  engine            = var.engine
  db_username       = var.db_username
  subnet-group-name = var.subnet-group-name
  db_name           = var.db_name
  private_subnets   = module.vpc.private_subnets
  vpc_id            = module.vpc.vpc_id

  depends_on = [
    module.vpc,
    module.eks
  ]
}

module "iam" {

  source = "./modules/iam"

  name                                             = var.name
  aws_iam_openid_connect_provider_arn              = module.eks.aws_iam_openid_connect_provider_arn
  aws_iam_openid_connect_provider_extract_from_arn = module.eks.aws_iam_openid_connect_provider_extract_from_arn
}

module "helm" {

  source = "./modules/helm"


  cluster_id                         = module.eks.cluster_id
  cluster_endpoint                   = module.eks.eks_cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  lbc_iam_depends_on                 = module.iam.lbc_iam_depends_on
  lbc_iam_role_arn                   = module.iam.lbc_iam_role_arn
  vpc_id                             = module.vpc.vpc_id
  aws_region                         = "us-east-1"
}