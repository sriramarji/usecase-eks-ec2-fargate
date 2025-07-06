terraform {
  backend "s3" {
    bucket  = "tf-bucket-prod1"
    key     = "uc-eks-ec2+fargate/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
    #use_lockfile = true
  }
}