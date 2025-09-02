variable "vpc_cidr_block" {
    description = "value for vpc cidr block"
    type        = string
}

variable "vpc_name" {
    description = "value for vpc name"
    type        = map(string)
}

variable "T-rex-public-subnet-availability-zone-1a" {
    description = "value for pusblic subnet availabilty zone 1a"
    type        = string
}

variable "T-rex-public-subnet-availability-zone-1a-cidr-block" {
    description = "value for public subnet availability zone 1a cidr block"
    type        = string
}

variable "T-rex-public-subnet-availability-zone-1a-name" {
    description = "value for public subnet availability zone 1a name"
    type        = map(string)
}

variable "T-rex-private-subnet-availability-zone-1a" {
    description = "value for pusblic subnet availabilty zone 1b"
    type        = string
}

variable "T-rex-private-subnet-availability-zone-1a-cidr-block" {
    description = "value for public subnet availability zone 1b cidr block"
    type        = string
}

variable "T-rex-private-subnet-availability-zone-1a-name" {
    description = "value for public subnet availability zone 1b name"
    type        = map(string)
}

variable "T-rex-public-subnet-availability-zone-1b-name" {
    description = "value for private subnet availabilty zone 1a"
    type        = map(string)
}

variable "T-rex-public-subnet-availability-zone-1b-cidr-block" {
    description = "value for private subnet availability zone 1a cidr block"
    type        = string
}

variable "T-rex-public-subnet-availability-zone-1b" {
    description = "value for private subnet availability zone 1a name"
    type        = string
}

variable "T-rex-private-subnet-availability-zone-1b" {
    description = "value for private subnet availabilty zone 1b"
    type        = string
}

variable "T-rex-private-subnet-availability-zone-1b-cidr-block" {
    description = "value for private subnet availability zone 1b cidr block"
    type        = string
}

variable "T-rex-private-subnet-availability-zone-1b-name" {
    description = "value for private subnet availability zone 1b name"
    type        = map(string)
}

variable "T-rex-igw-name" {
    description = "value for internet gateway name"
    type        = map(string)
}

variable "T-rex-elastic-ip-domain" {
    description = "value for elastic ip domain"
    type        = string
}

variable "T-rex-elastic-ip-name" {
    description = "value for elastic ip name"
    type        = map(string)
}

variable "T-rex-public-rt-name" {
    description = "value for public route table name"
    type        = map(string)
}

variable "T-rex-public-route-destination_cidr_block" {
    description = "value for public route destination cidr block"
    type        = string
}

variable "T-rex-private-rt-name" {
    description = "value for private route table name"
    type        = map(string)
}

variable "T-rex-private-route-destination_cidr_block" {
    description = "value for private route destination cidr block"
    type        = string
}

variable "T-rex-nat-gateway-name" {
    description = "value for nat gateway name"
    type        = map(string)
}

variable "security_group_name" {
    description = "value for security group name"
    type        = string
}

variable "security_group_tag_name" {
    description = "value for security group tag name"
    type        = map(string)
  
}

variable "security_group_description" {
    description = "value for security group description"
    type        = string
  
}

variable "security_group_ingress_cidr_ipv4" {
    description = "value for security group cidr ipv4"
    type        = string
}

variable "security_group_ingress_protocol" {
    description = "value for security group protocol"
    type        = string
}

variable "security_group_egress_cidr_ipv4" {
    description = "value for security group cidr ipv4"
    type        = string
}

variable "security_group_egress_protocol" {
    description = "value for security group protocol"
    type        = string
}