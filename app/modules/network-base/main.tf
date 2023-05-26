#----------------------------------------------#
# network-base: main                           #
# ./app/modules/network-base/main.tf           #
#----------------------------------------------#


#-- Resource: AWS VPC
resource "aws_vpc" "vpc_ws_rsrc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_tags
  }
}


#-- Resource: AWS Public Subnet
resource "aws_subnet" "sub_pub_rsrc" {
  vpc_id     = aws_vpc.vpc_ws_rsrc.id
  cidr_block = var.pub_sub_cidr

  tags = {
    Name = var.pub_sub_tags
  }
}

#-- Resource: AWS Private Subnet
resource "aws_subnet" "sub_priv_rsrc" {
  vpc_id     = aws_vpc.vpc_ws_rsrc.id
  cidr_block = var.priv_sub_cidr

  tags = {
    Name = var.priv_sub_tags
  }
}

#--------------------------------------------

#-- Resource: AWS Internet Gateway
resource "aws_internet_gateway" "igw_ws_rsrc" {
  vpc_id = aws_vpc.vpc_ws_rsrc.id

  tags = {
    Name = var.wl_igw_tags
  }
}

#--------------------------------------------

#-- Resource: AWS Route Table
# public route table
resource "aws_route_table" "rt_pub_rsrc" {
  vpc_id = aws_vpc.vpc_ws_rsrc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_ws_rsrc.id
  }

  tags = {
    Name = var.rt_pub_tag
  }
}

# AWS Resource: public route table associate
resource "aws_route_table_association" "rt_pub_asso" {
  subnet_id      = aws_subnet.sub_pub_rsrc.id
  route_table_id = aws_route_table.rt_pub_rsrc.id
}

#-- Resource: AWS Security Group Open
resource "aws_security_group" "sg_ajar" {
  vpc_id = aws_vpc.vpc_ws_rsrc.id
  # name = join("_", ["sg", var.vpc_id_mdl])
  name = var.sg_ajar_name
  dynamic "ingress" {
    for_each = var.ajar_rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.ajar_sg_tag
  }
}


resource "aws_security_group" "sg_secure" {
  vpc_id = aws_vpc.vpc_ws_rsrc.id
  # name = join("_", ["sg", var.vpc_id_mdl])
  name = var.sg_priv_name
  dynamic "ingress" {
    for_each = var.private_rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.priv_sg_tag
  }
}


#---- graveyard
# AWS Resource: private route table
# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.vpc_ws_rsrc.id

#   route {
#     cidr_block = "0.0.0.0/0" #variable?
#     gateway_id = aws_internet_gateway.igw_ws_rsrc.id
#   }

#     # route {
#     #   ipv6_cidr_block        = "::/0"
#     #   egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#     # }

#   tags = {
#     Name = var.rt_pub_asso_tag
#   }
# }


# AWS Resource: private route table associate
# resource "aws_route_table_association" "private_rt_asso" {
#   subnet_id      = aws_subnet.sub_priv_rsrc.id
#   route_table_id = aws_route_table.private_rt.id
# }

#--------------------------------------------