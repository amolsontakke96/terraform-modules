output "cluster_name" {
    value = aws_eks_cluster.demo-eks-cluster-name.name
}

output "node_group_name" {
    value = aws_eks_node_group.eks-node-group.node_group_name
}

output "aws_eks_fargate_profile" {
    value = aws_eks_fargate_profile.demo-eks-farget-profile.fargate_profile_name
}