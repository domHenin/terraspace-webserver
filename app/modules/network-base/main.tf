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

#-- Resource: AWS Internet Gateway
resource "aws_internet_gateway" "igw_ws_rsrc" {
  vpc_id = aws_vpc.vpc_ws_rsrc.id

  tags = {
    Name = var.wl_igw_tags
  }
}


#-- Resource: AWS Internet Gateway Attachment
resource "aws_internet_gateway_attachment" "igw_ws_att" {
  internet_gateway_id = aws_internet_gateway.igw_ws_rsrc.id
  vpc_id              = aws_vpc.vpc_ws_rsrc.id
}




#-- Resource: AWS Route Table