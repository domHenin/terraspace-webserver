#----------------------------------------------#
# network-base: variables                      #
# ./app/modules/network-base/variables.tf      #
#----------------------------------------------#


variable "vpc_cidr" {
  description = "cidr range used for VPC"
  type        = string
  default     = "172.69.0.0/16"
}

variable "vpc_tags" {
  description = "tags for VPC"
  type        = string
  default     = "vpc_ws"
}

# ------------------------------


variable "pub_sub_cidr" {
  description = "cidr range used for public subnet"
  type        = string
  default     = "172.69.1.0/24"
}

variable "pub_sub_tags" {
  description = "tags for public subnet"
  type        = string
  default     = "public_subnet"
}

# ------------------------------

variable "priv_sub_cidr" {
  description = "cidr range used for private subnet"
  type        = string
  default     = "172.69.2.0/24"
}

variable "priv_sub_tags" {
  description = "tags for private subnet"
  type        = string
  default     = "private_subnet"
}

# ------------------------------

variable "wl_igw_tags" {
  description = "tags for internet gateway"
  type        = string
  default     = "internet-gateway-ws"
}