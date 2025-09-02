locals {
  subnet_ids = [
    var.public_subnet_id_1a,
    var.public_subnet_id_1b,
    var.private_subnet_id_1a,
    var.private_subnet_id_1b
  ]
}

locals {
  subnet_id = [
    var.private_subnet_id_1a,
    var.private_subnet_id_1b
  ]
}

variable "demo-eks-cluster-role-name" {
    description = "value for eks cluster role name"
    type = string  
}

variable "demo-eks-cluster-name" {
    description = "value for eks cluster name"
    type = string
}

variable "endpoint_private_access" {
    description = "value for vpc config endpoint private access"
    type = bool
}

variable "endpoint_public_access" {
    description = "value for vpc config endpoint public access"
    type = bool
}

variable "cluster_verison" {
    description = "value for cluster version"
    type = string
}

variable "support_type" {
    description = "value for upgrade policy support type"
    type = string
}

variable "authentication_mode" {
    description = "value for access config authentication mode"
    type = string
}

variable "bootstrap_cluster_creator_admin_permissions" {
    description = "value for access config bootstrap cluster creator admin permissions"
    type = bool
}


variable "bootstrap_self_managed_addons" {
    description = "value for bootstrap self managed addons"
    type = string
}

variable "demo-eks-farget-profile-role" {
    description = "value for eks farget profile role name"
    type = string
}

variable "demo-eks-farget-profile" {
    description = "value for eks farget profile name"
    type = string
}

variable "selector-namespace" {
    description = "value for selector namespace"
    type = list(string)
}

variable "eks-node-group-role" {
    description = "value for eks node group role"
    type = string
}

variable "eks-node-group" {
    description = "value for eks node group name"
    type = string
}

variable "desired_size" {
    description = "value for scaling config desired size"
    type = number
}

variable "max_size" {
    description = "value for scaling config max size"
    type = number
}

variable "min_size" {
    description = "value for scaling config min size"
    type = number
}

variable "max_unavailable" {
    description = "value for update config max unavailable"
    type = number  
}

variable "public_subnet_id_1a" {
    description = "value for public subnet 1a"
    type = string
}

variable "public_subnet_id_1b" {
    description = "value for public subnet 1b"
    type = string
}

variable "private_subnet_id_1a" {
    description = "value for private subnet 1a"
    type = string
}

variable "private_subnet_id_1b" {
    description = "value for private subnet 1b"
    type = string
}