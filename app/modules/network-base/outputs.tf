#----------------------------------------------#
# network-base: outputs                        #
# ./app/modules/network-base/outputs.tf        #
#----------------------------------------------#

# output: subnet_id --- public/private
# output: vpc_id
# output: internet-gateway_id

output "vpc_id_output" {
  description = "output vpc id"
  value       = aws_vpc.vpc_ws_rsrc.id
}

output "sub_pub_id_output" {
  description = "output public subnet"
  value       = aws_subnet.sub_pub_rsrc.id
}

output "sub_priv_id_output" {
  description = "output private subnet"
  value       = aws_subnet.sub_priv_rsrc.id
}


output "igw_id_output" {
  description = "outuput internet gateway"
  value       = aws_internet_gateway.igw_ws_rsrc.id
}

output "sg_ajar_id_output" {
  description = "output security group ajar"
  value = aws_security_group.sg_ajar.id  
}

output "sg_priv_id_output" {
  description = "output security group private"
  value = aws_security_group.sg_secure.id
}

