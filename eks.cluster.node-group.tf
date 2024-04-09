resource "aws_eks_node_group" "eks_cluster_node_group" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.eks_cluster.node_group.name
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = aws_subnet.privates[*].id
  capacity_type   = var.eks_cluster.node_group.capacity_type
  instance_types  = var.eks_cluster.node_group.instance_types

  scaling_config {
    desired_size = var.eks_cluster.node_group.scaling_config.desired_size
    max_size     = var.eks_cluster.node_group.scaling_config.max_size
    min_size     = var.eks_cluster.node_group.scaling_config.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_node_group_role_AmazonEC2ContainerRegistryReadOnly,
    aws_iam_role_policy_attachment.eks_node_group_role_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_node_group_role_AmazonEKSWorkerNodePolicy
  ]
}
