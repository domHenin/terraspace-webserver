#-----------------------------------------------------#
# security_group-base: variables                      #
# ./app/modules/security_group-base/variables.tf      #
#-----------------------------------------------------#

#--- `../network-base` module calls
# variable "vpc_id_mdl" {
#   description = "vpc id module call"
#   type        = string
# }



#----- Local Variables
# variable "ajar_rules" {
# type = list(object({
#     port        = number
#     proto       = string
#     cidr_blocks = list(string)
#   }))
#   default = [
#     {
#       port        = 80
#       proto       = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     },
#     {
#       port        = 22
#       proto       = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
# }

# variable "private_rules" {
# type = list(object({
#     port        = number
#     proto       = string
#     cidr_blocks = list(string)
#   }))
#   default = [
#     {
#       port        = 22
#       proto       = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
# }

# variable "sg_ajar_name" {
#   description = "name for ajar security group"
#   type = string
#   default = "ajar_sg"
# }

# variable "sg_priv_name" {
#   description = "name for private security group"
#   type = string
#   default = "private_sg"
# }

# variable "ajar_sg_tag" {
#     description = "security group tag public"
#     type = string
#     default = "sg_ajar_tag"
# }

# variable "priv_sg_tag" {
#     description = "security group tag private"
#     type = string
#     default = "sg_private_tag"
# }