#--------------------------------------------------#
# compute-stack: main                              #
# ./app/stacks/compute-stack/main.tf               #
#--------------------------------------------------#

module "compute-base" {
  source = "../../modules/compute-base"

  instance_type = var.instance_type
  apache_tag    = var.apache_tag
  database_tag  = var.database_tag

  public_subnet_id  = var.public_subnet_id
  private_subnet_id = var.private_subnet_id

  public_security_group_id  = var.public_security_group_id
  private_security_group_id = var.private_security_group_id
}

# module "network-base" {
#   source = "../../modules/network-base"
# }