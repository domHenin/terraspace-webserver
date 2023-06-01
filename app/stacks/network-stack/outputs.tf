#--------------------------------------------------#
# network-stack: outputs                           #
# ./app/stacks/network-stack/outputs.tf            #
#--------------------------------------------------#

output "vpc_id_output" {
  description = "output vpc id"
  value       = module.network-base.vpc_id_output
}