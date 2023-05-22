#--------------------------------------------------#
# network-stack: main                              #
# ./app/stacks/network-stack/main.tf               #
#--------------------------------------------------#



module "route_table-base" {
source = "../../modules/route_table-base"

  vpc_id_mdl = module.network-base.vpc_id_output
  igw_id_mdl = module.network-base.igw_id_output
  sub_pub_id_mdl = module.network-base.sub_pub_id_output
}

module "security_group-base" {
  source = "../../modules/security_group-base"

  vpc_id_mdl = module.network-base.vpc_id_output
}

module "network-base" {
    source = "../../modules/network-base"
}