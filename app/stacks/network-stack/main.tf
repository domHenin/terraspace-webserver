#--------------------------------------------------#
# network-stack: main                              #
# ./app/stacks/network-stack/main.tf               #
#--------------------------------------------------#

module "network-base" {
  source = "../../modules/network-base"

#-- vpc  
  vpc_cidr = var.vpc_cidr
  vpc_tags = var.vpc_tags

#-- public subnet
  pub_sub_cidr = var.pub_sub_cidr
  pub_sub_tags = var.pub_sub_tags

#-- private subnet
  priv_sub_cidr = var.priv_sub_cidr
  priv_sub_tags = var.priv_sub_tags

#-- internet gateway
  wl_igw_tags = var.wl_igw_tags

#-- route table:- public
  rt_pub_tag     = var.rt_pub_tag 
  # rt_pub_asso_tag = var.rt_pub_asso_tag

#-- security group:- public
  sg_ajar_name = var.sg_ajar_name
  ajar_sg_tag  = var.ajar_sg_tag

#-- security group:- private
  sg_priv_name = var.sg_priv_name
  priv_sg_tag  = var.priv_sg_tag
}