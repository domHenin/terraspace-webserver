#--------------------------------------------------#
# network-stack: main                              #
# ./app/stacks/network-stack/main.tf               #
#--------------------------------------------------#

module "network-base" {
  source = "../../modules/network-base"

  
#   vpc_cidr = "172.69.0.0/16"
#   vpc_tags = "vpc_ws"

#   pub_sub_cidr = "172.69.1.0/24"
#   pub_sub_tags = "public_subnet"

# #-- private subnet
#   priv_sub_cidr = "172.69.2.0/24"
#   priv_sub_tags = "private_subnet"

# #-- internet gateway 
#   wl_igw_tags = "internet-gateway-ws"

# #-- route table:- public
#   rt_pub_tag     = "webserver_public_route_table"
#   rt_pub_ass_tag = "public_route_table_association"

# #-- security group:- public
#   sg_ajar_name = "ajar_sg"
#   ajar_sg_tag  = "sg_ajar_tag"

# #-- security group:- private
#   sg_priv_name = "private_sg"
#   priv_sg_tag  = "sg_private_tag"
}