resource "aws_iam_role" "karpenter_node_role" {
  name = "KarpenterNodeRole-${var.cluster_name}"

  assume_role_policy = file(var.assume_role_policy_node_role)
}

resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  role       = aws_iam_role.karpenter_node_role.name
  policy_arn = var.worker_node_policy_arn
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  role       = aws_iam_role.karpenter_node_role.name
  policy_arn = var.cni_policy_arn
}

resource "aws_iam_role_policy_attachment" "ecr_read_only_policy" {
  role       = aws_iam_role.karpenter_node_role.name
  policy_arn = var.read_only_policy_arn
}

resource "aws_iam_role_policy_attachment" "ssm_managed_instance_core" {
  role       = aws_iam_role.karpenter_node_role.name
  policy_arn = var.ssm_managed_instance_core_arn
}

##################################################
## controller policy
# Define variables (replace with your values)
# IAM Role for Karpenter Controller (uses IRSA)
##################################################

resource "aws_iam_role" "karpenter_controller_role" {
  name               = "KarpenterControllerRole-${var.cluster_name}"
  assume_role_policy = file(var.assume_role_policy_controller_role)
}

# IAM Policy for Karpenter Controller
resource "aws_iam_policy" "karpenter_controller_policy" {
  name   = "KarpenterControllerPolicy-${var.cluster_name}"
  policy = file(var.controller_policy)
}

resource "aws_iam_role_policy_attachment" "karpenter_controller_role_policy_attachment" {
  role       = aws_iam_role.karpenter_controller_role.name
  policy_arn = aws_iam_policy.karpenter_controller_policy.arn
}


resource "aws_iam_instance_profile" "karpenter" {
  name = "KarpenterNodeInstanceProfile-${var.cluster_name}"
  role = var.worker_node_role_name
}

resource "aws_iam_role_policy_attachment" "karpenter_ssm_policy" {
  role       = var.worker_node_role_name
  policy_arn = data.aws_iam_policy.ssm_managed_instance.arn
}

resource "kubernetes_namespace" "karpenter" {
  metadata {
    name = var.metadata_name
  }
}

# Deploy Karpenter using Helm
resource "helm_release" "karpenter" {
  name       = var.helm_name
  repository = var.helm_repository
  chart      = var.helm_chart
  version    = var.helm_version
  namespace  = var.karpenter_namespace

  set {
    name  = var.helm_release_karpenter_set_name
    value = var.cluster_name
  }

  set {
    name  = var.helm_release_karpenter_second_set_name
    value = "arn:aws:iam::${local.account_id}:role/KarpenterControllerRole-${var.cluster_name}"
  }


  set {
    name  = var.helm_release_karpenter_third_set_name
    value = aws_iam_instance_profile.karpenter.name
  }

  set {
    name  = var.helm_release_karpenter_fourth_set_name
    value = var.helm_release_karpenter_fourth_set_value
  }

  set {
    name  = var.helm_release_karpenter_fifth_set_name
    value = var.helm_release_karpenter_fifth_set_value
  }

  set {
    name  = var.helm_release_karpenter_sixth_set_name
    value = var.helm_release_karpenter_sixth_set_value
  }

  set {
    name  = var.helm_release_karpenter_seventh_set_name
    value = var.helm_release_karpenter_seventh_set_value
  }
}

data "local_file" "node_pool_yaml" {
  filename = var.node_pool_yaml_path
}
resource "kubectl_manifest" "node_pool" {
  yaml_body = data.local_file.node_pool_yaml.content
}


data "local_file" "ec2_node_class_yaml" {
  filename = var.ec2_node_class_yaml_path
}

resource "kubectl_manifest" "ec2_node_class" {
  yaml_body = data.local_file.ec2_node_class_yaml.content
}



