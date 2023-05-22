#--------------------------------------------------#
# security_group-base: outputs                     #
# ./app/modules/security_group-base/outputs.tf     #
#--------------------------------------------------#

# output: security_groups  --- public/private

output "sg_ajar_id_output" {
  description = "output public security group"
  value       = aws_security_group.sg_ajar.id
}

output "sg_priv_id_output" {
  description = "output private security group"
  value       = aws_security_group.sg_secure.id
}
