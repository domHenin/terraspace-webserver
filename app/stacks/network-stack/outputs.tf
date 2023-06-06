#--------------------------------------------------#
# network-stack: outputs                           #
# ./app/stacks/network-stack/outputs.tf            #
#--------------------------------------------------#

output "vpc_id_output" {
  description = "output vpc id"
  value       = module.network-base.vpc_id_output
}

output "sub_pub_id_output" {
  description = "output public subnet"
  # value       = aws_subnet.sub_pub_rsrc.id
  value = module.network-base.sub_pub_id_output
}

output "sub_priv_id_output" {
  description = "output private subnet"
  # value       = aws_subnet.sub_priv_rsrc.id
  value = module.network-base.sub_priv_id_output
}


output "igw_id_output" {
  description = "outuput internet gateway"
  # value       = aws_internet_gateway.igw_ws_rsrc.id
  value = module.network-base.igw_id_output
}

output "sg_ajar_id_output" {
  description = "output security group ajar"
  # value       = aws_security_group.sg_ajar.id
  value = module.network-base.sg_ajar_id_output
}

output "sg_priv_id_output" {
  description = "output security group private"
  # value       = aws_security_group.sg_secure.id
  value = module.network-base.sg_priv_id_output
}