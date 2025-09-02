resource "aws_iam_role" "demo-eks-cluster-role-name" {
    name = var.demo-eks-cluster-role-name
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "sts:AssumeRole",
                    "sts:TagSession"
                ]
                Effect = "Allow"
                Principal = {
                    Service = "eks.amazonaws.com"
                }
            },
        ]
    })
}

resource "aws_iam_role_policy_attachment" "demo-eks-cluster_AmazonEKSClusterPolicy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
    role = aws_iam_role.demo-eks-cluster-role-name.name
}


resource "aws_eks_cluster" "demo-eks-cluster-name" {
    name = var.demo-eks-cluster-name
    
    vpc_config {
      subnet_ids = local.subnet_ids
      endpoint_private_access = var.endpoint_private_access
      endpoint_public_access = var.endpoint_public_access
    }   

    role_arn = aws_iam_role.demo-eks-cluster-role-name.arn
    version = var.cluster_verison

    upgrade_policy {
      support_type = var.support_type
    }

    access_config {
      authentication_mode = var.authentication_mode
      bootstrap_cluster_creator_admin_permissions = var.bootstrap_cluster_creator_admin_permissions
    }

    bootstrap_self_managed_addons = var.bootstrap_self_managed_addons
    
    depends_on = [ aws_iam_role_policy_attachment.demo-eks-cluster_AmazonEKSClusterPolicy ]
  
}

resource "aws_iam_role" "demo-eks-farget-profile-role" {
  name = var.demo-eks-farget-profile-role
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "eks-fargate-pods.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "demo-eks-farget-profile-AmazonEKSFargatePodExecutionRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role = aws_iam_role.demo-eks-farget-profile-role.name
}


resource "aws_eks_fargate_profile" "demo-eks-farget-profile" {
  cluster_name = aws_eks_cluster.demo-eks-cluster-name.name
  fargate_profile_name = var.demo-eks-farget-profile
  pod_execution_role_arn = aws_iam_role.demo-eks-farget-profile-role.arn
  subnet_ids = local.subnet_id
  selector {
    namespace = var.selector-namespace[0]
  }

  selector {
    namespace = var.selector-namespace[1]
  }
  depends_on = [ aws_iam_role_policy_attachment.demo-eks-farget-profile-AmazonEKSFargatePodExecutionRolePolicy ]
}

resource "aws_iam_role" "eks-node-group-role" {
  name = var.eks-node-group-role
  assume_role_policy = jsonencode({
    Statement = [{
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
            Service = "ec2.amazonaws.com"
        }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "eks-node-group-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "eks-node-group-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role = aws_iam_role.eks-node-group-role.name
}

resource "aws_iam_role_policy_attachment" "eks-node-group-AmazonEC2ContainerRegistryReadOnly" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.eks-node-group-role.name
}

resource "aws_eks_node_group" "eks-node-group" {
    cluster_name = aws_eks_cluster.demo-eks-cluster-name.name
    node_group_name = var.eks-node-group
    node_role_arn = aws_iam_role.eks-node-group-role.arn
    subnet_ids = local.subnet_id
    scaling_config {
      desired_size = var.desired_size
      max_size = var.max_size
      min_size = var.min_size
    }
    update_config {
      max_unavailable = var.max_unavailable
    }

    depends_on = [ 
        aws_iam_role_policy_attachment.eks-node-group-AmazonEC2ContainerRegistryReadOnly,
        aws_iam_role_policy_attachment.eks-node-group-AmazonEKS_CNI_Policy,
        aws_iam_role_policy_attachment.eks-node-group-AmazonEKSWorkerNodePolicy 
    ]
  
}