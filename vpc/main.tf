resource "aws_vpc" "T-rex-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = var.vpc_name
}

resource "aws_subnet" "T-rex-public-subnet-1a" {
  vpc_id            = aws_vpc.T-rex-vpc.id
  availability_zone = var.T-rex-public-subnet-availability-zone-1a
  cidr_block        = var.T-rex-public-subnet-availability-zone-1a-cidr-block
  tags              = var.T-rex-public-subnet-availability-zone-1a-name
}

resource "aws_subnet" "T-rex-private-subnet-1a" {
  vpc_id            = aws_vpc.T-rex-vpc.id
  availability_zone = var.T-rex-private-subnet-availability-zone-1a
  cidr_block        = var.T-rex-private-subnet-availability-zone-1a-cidr-block
  tags              = var.T-rex-private-subnet-availability-zone-1a-name
}

resource "aws_subnet" "T-rex-public-subnet-1b" {
  vpc_id            = aws_vpc.T-rex-vpc.id
  availability_zone = var.T-rex-public-subnet-availability-zone-1b
  cidr_block        = var.T-rex-public-subnet-availability-zone-1b-cidr-block
  tags              = var.T-rex-public-subnet-availability-zone-1b-name
}

resource "aws_subnet" "T-rex-private-subnet-1b" {
  vpc_id            = aws_vpc.T-rex-vpc.id
  availability_zone = var.T-rex-private-subnet-availability-zone-1b
  cidr_block        = var.T-rex-private-subnet-availability-zone-1b-cidr-block
  tags              = var.T-rex-private-subnet-availability-zone-1b-name
}

resource "aws_internet_gateway" "T-rex-igw" {
  vpc_id = aws_vpc.T-rex-vpc.id
  tags = var.T-rex-igw-name
}

resource "aws_eip" "T-rex-elastic-ip" {
  domain = var.T-rex-elastic-ip-domain
  tags = var.T-rex-elastic-ip-name
}

resource "aws_route_table" "T-rex-public-rt" {
  vpc_id = aws_vpc.T-rex-vpc.id
  tags = var.T-rex-public-rt-name
}

resource "aws_route" "T-rex-public-route" {
  route_table_id         = aws_route_table.T-rex-public-rt.id
  destination_cidr_block = var.T-rex-public-route-destination_cidr_block
  gateway_id             = aws_internet_gateway.T-rex-igw.id
}

resource "aws_route_table_association" "T-rex-public-route-association-1a" {
  subnet_id      = aws_subnet.T-rex-public-subnet-1a.id
  route_table_id = aws_route_table.T-rex-public-rt.id
}

resource "aws_route_table_association" "T-rex-public-route-association-1b" {
  subnet_id      = aws_subnet.T-rex-public-subnet-1b.id
  route_table_id = aws_route_table.T-rex-public-rt.id
}

resource "aws_route_table" "T-rex-private-rt" {
  vpc_id = aws_vpc.T-rex-vpc.id
  tags = var.T-rex-private-rt-name
}

resource "aws_route" "T-rex-private-route" {
  route_table_id         = aws_route_table.T-rex-private-rt.id
  destination_cidr_block = var.T-rex-private-route-destination_cidr_block
  nat_gateway_id         = aws_nat_gateway.T-rex-nat-gateway.id

}

resource "aws_route_table_association" "T-rex-private-route-association-1a" {
  subnet_id      = aws_subnet.T-rex-private-subnet-1a.id
  route_table_id = aws_route_table.T-rex-private-rt.id
}

resource "aws_route_table_association" "T-rex-private-route-association-1b" {
  subnet_id      = aws_subnet.T-rex-private-subnet-1b.id
  route_table_id = aws_route_table.T-rex-private-rt.id
}

resource "aws_nat_gateway" "T-rex-nat-gateway" {
  allocation_id = aws_eip.T-rex-elastic-ip.id
  subnet_id     = aws_subnet.T-rex-public-subnet-1a.id
  tags = var.T-rex-nat-gateway-name
}

resource "aws_security_group" "T-rex-sg" {
  name = var.security_group_name
  description = var.security_group_description
  vpc_id = aws_vpc.T-rex-vpc.id
  tags = var.security_group_tag_name
}

resource "aws_security_group_rule" "ingress_allow_ssh" {
  type              = "ingress"
  to_port           = 0
  protocol          = var.security_group_ingress_protocol
  from_port         = 0
  security_group_id = aws_security_group.T-rex-sg.id
  cidr_blocks       = [var.security_group_ingress_cidr_ipv4]
}

resource "aws_security_group_rule" "egress_allow_all" {
  type              = "egress"
  to_port           = 0
  protocol          = var.security_group_egress_protocol
  from_port         = 0
  security_group_id = aws_security_group.T-rex-sg.id
  cidr_blocks       = [var.security_group_egress_cidr_ipv4]
}
