variable "karpenter_namespace" {
  description = "Namespace where Karpenter is deployed"
  type        = string
  default     = "karpenter"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = null
}

variable "region" {
  description = "AWS region for the EKS cluster"
  type        = string
  default     = "eu-central-1"
}

variable "worker_node_role_name" {
  description = "IAM role name for worker nodes"
  type        = string
  default     = null
}

variable "oidc_endpoint" {
  description = "OIDC endpoint for the EKS cluster"
  type        = string
  default     = null
}
variable "node_pool_yaml_path" {
  description = "Path to the NodePool YAML file"
  type        = string
  default     = "node_pool.yaml"
}
variable "ec2_node_class_yaml_path" {
  description = "Path to the EC2NodeClass YAML file"
  type        = string
  default     = "ec2_node_class.yaml"
}
variable "helm_name" {
  description = "The name of the Helm release."
  type        = string
}

variable "helm_repository" {
  description = "The URL of the Helm chart repository."
  type        = string
}

variable "helm_chart" {
  description = "The name of the Helm chart to deploy."
  type        = string
}

variable "helm_version" {
  description = "The version of the Helm chart to deploy."
  type        = string
}
variable "assume_role_policy_node_role" {
  description = "Path to the JSON file containing the assume role policy for the Karpenter node role."
  type        = string
}

variable "worker_node_policy_arn" {
  description = "ARN of the IAM policy for Amazon EKS worker nodes."
  type        = string
}

variable "cni_policy_arn" {
  description = "ARN of the IAM policy for Amazon EKS CNI."
  type        = string
}

variable "read_only_policy_arn" {
  description = "ARN of the IAM policy for read-only access to ECR."
  type        = string
}

variable "ssm_managed_instance_core_arn" {
  description = "ARN of the IAM policy for Amazon SSM Managed Instance Core."
  type        = string
}

variable "assume_role_policy_controller_role" {
  description = "Path to the JSON file containing the assume role policy for the Karpenter controller role."
  type        = string
}

variable "controller_policy" {
  description = "Path to the JSON file containing the policy for the Karpenter controller."
  type        = string
}

# Variable for the first set
variable "helm_release_karpenter_set_name" {
  description = "The name for the first Helm set."
  type        = string
}



# Variable for the second set
variable "helm_release_karpenter_second_set_name" {
  description = "The name for the second Helm set."
  type        = string
}


# Variable for the third set
variable "helm_release_karpenter_third_set_name" {
  description = "The name for the third Helm set."
  type        = string
}



# Variable for the fourth set
variable "helm_release_karpenter_fourth_set_name" {
  description = "The name for the fourth Helm set."
  type        = string
}

variable "helm_release_karpenter_fourth_set_value" {
  description = "The value for the fourth Helm set."
  type        = string
}

# Variable for the fifth set
variable "helm_release_karpenter_fifth_set_name" {
  description = "The name for the fifth Helm set."
  type        = string
}

variable "helm_release_karpenter_fifth_set_value" {
  description = "The value for the fifth Helm set."
  type        = string
}

# Variable for the sixth set
variable "helm_release_karpenter_sixth_set_name" {
  description = "The name for the sixth Helm set."
  type        = string
}

variable "helm_release_karpenter_sixth_set_value" {
  description = "The value for the sixth Helm set."
  type        = string
}

# Variable for the seventh set
variable "helm_release_karpenter_seventh_set_name" {
  description = "The name for the seventh Helm set."
  type        = string
}

variable "helm_release_karpenter_seventh_set_value" {
  description = "The value for the seventh Helm set."
  type        = string
}
variable "metadata_name" {
  description = "The name of the Kubernetes namespace."
  type        = string
}
