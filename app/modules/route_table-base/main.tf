#--------------------------------------------------#
# route_table-base: main                           #
# ./app/modules/route_table-base/main.tf           #
#--------------------------------------------------#

# # AWS Resource: public route table
# resource "aws_route_table" "rt_pub_rsrc" {
#   vpc_id = var.vpc_id_mdl

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = var.igw_id_mdl
#   }

#   tags = {
#     Name = var.rt_pub_tag
#   }
# }

# # AWS Resource: public route table associate
# resource "aws_route_table_association" "rt_pub_asso" {
#   subnet_id      = var.sub_pub_id_mdl
#   route_table_id = aws_route_table.rt_pub_rsrc.id
# }


# #--------------------------------------------

# # AWS Resource: private route table
# resource "aws_route_table" "private_rt" {
#   vpc_id = var.vpc_id_mdl

#   route {
#     cidr_block = "0.0.0.0/0" #variable?
#     gateway_id = var.igw_id_mdl
#   }

#     # route {
#     #   ipv6_cidr_block        = "::/0"
#     #   egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
#     # }

#   tags = {
#     Name = var.rt_pub_asso_tag
#   }
# }


# # AWS Resource: private route table associate
# resource "aws_route_table_association" "private_rt_asso" {
#   subnet_id      = var.sub_pub_id_mdl
#   route_table_id = aws_route_table.private_rt.id
# }