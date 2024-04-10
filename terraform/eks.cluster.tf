resource "aws_eks_cluster" "this" {
  name                      = var.eks_cluster.name
  enabled_cluster_log_types = var.eks_cluster.enabled_cluster_log_types
  role_arn                  = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = aws_subnet.privates[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_AmazonEKSClusterPolicy,
  ]
}
