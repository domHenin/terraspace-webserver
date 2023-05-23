#--------------------------------------------------#
# compute-stack: main                              #
# ./app/stacks/compute-stack/main.tf               #
#--------------------------------------------------#

module "compute-base" {
    source = "../../modules/compute-base"

    public_subnet_id = module.network-base.sub_pub_id_output
    private_subnet_id = module.network-base.sub_priv_id_output

    public_security_group_id = module.security_group-base.sg_ajar_id_output
    private_security_group_id = module.security_group-base.sg_priv_id_output
}

module "security_group-base" {
    source = "../../modules/security_group-base"

    vpc_id_mdl = module.network-base.vpc_id_output
}

module "network-base" {
    source = "../../modules/network-base"
}