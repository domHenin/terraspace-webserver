#--------------------------------------------------#
# network-stack: main                              #
# ./app/stacks/network-stack/main.tf               #
#--------------------------------------------------#

module "network-base" {
    source = "../../modules/network-base"
}