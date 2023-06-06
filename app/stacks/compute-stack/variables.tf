# #--------------------------------------------------#
# # compute-stack: variables                         #
# # ./app/stacks/compute-stack/variables.tf          #
# #--------------------------------------------------#

# # reference `./network-base` 
# variable "public_subnet_id" {
#   description = "public subnet id call network-base"
#   type        = string
# }

# variable "public_security_group_id" {
#   description = "public security group id call network-base"
#   type        = string
# }

# ----

# variable "private_subnet_id" {
#   description = "private subnet id call network-base"
#   type        = string
# }

# variable "private_security_group_id" {
#   description = "private security group id call network-base"
#   type        = string
# }

# # -------------------

# variable "instance_type" {
#   description = "weberver instance type"
#   type        = string
#   # default     = "t2.micro"
# }

# variable "apache_tag" {
#   description = "webserver tag"
#   type        = string
#   # default     = "apache_webserver_tag"
# }

# variable "database_tag" {
#   description = "database tag"
#   type        = string
#   # default     = "database_tag"
# }