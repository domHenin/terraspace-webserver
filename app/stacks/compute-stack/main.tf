#--------------------------------------------------#
# compute-stack: main                              #
# ./app/stacks/compute-stack/main.tf               #
#--------------------------------------------------#

# module "compute-base" {
#   source = "../../modules/compute-base"

#   public_subnet_id  = module.network-base.sub_pub_id_output
#   private_subnet_id = module.network-base.sub_priv_id_output

#   public_security_group_id  = module.network-base.sg_ajar_id_output
#   private_security_group_id = module.network-base.sg_priv_id_output

#   instance_type = var.instance_type
#   apache_tag = var.apache_tag
#   database_tag = var.database_tag
# }

# module "network-base" {
#   source = "../../modules/network-base"
# }