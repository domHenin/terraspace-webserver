#--------------------------------------------------#
# compute-stack: main                              #
# ./app/stacks/compute-stack/main.tf               #
#--------------------------------------------------#

module "compute-base" {
  source = "../../modules/compute-base"

  public_subnet_id  = module.network-base.sub_pub_id_output
  private_subnet_id = module.network-base.sub_priv_id_output

  public_security_group_id  = module.network-base.sg_ajar_id_output
  private_security_group_id = module.network-base.sg_priv_id_output
}

module "network-base" {
  source = "../../modules/network-base"
}