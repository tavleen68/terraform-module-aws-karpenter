data "tls_certificate" "eks" {
  url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
}
data "aws_eks_cluster" "this" {
  name = var.cluster_name
}
data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}
data "aws_caller_identity" "current" {}

data "aws_iam_policy" "ssm_managed_instance" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}
