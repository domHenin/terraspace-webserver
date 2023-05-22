#--------------------------------------------------#
# route_table-base: variables                      #
# ./app/modules/route_table-base/variables.tf      #
#--------------------------------------------------#



#--- `../network-base` module calls
variable "vpc_id_mdl" {
  description = "vpc id module call"
  type        = string
}


variable "igw_id_mdl" {
  description = "internet gateway id module call"
  type        = string
}


variable "sub_pub_id_mdl" {
  description = "public subnet id module call"
  type        = string
}



# --- local variables

variable "rt_pub_tag" {
  description = "public route table tag"
  type        = string
  default     = "webserver_public_route_table"
}

variable "rt_pub_asso_tag" {
  description = "public route table association tag"
  type        = string
  default     = "public_route_table_association"
}
