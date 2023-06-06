#--------------------------------------------------#
# network-stack: variables                         #
# ./app/stacks/network-stack/variables.tf          #
#--------------------------------------------------#

variable "vpc_cidr" {
  description = "cidr range used for VPC"
  type        = string
  # default     = "172.69.0.0/16"
}

variable "vpc_tags" {
  description = "tags for VPC"
  type        = string
  # default     = "vpc_ws"
}

# ------------------------------


variable "pub_sub_cidr" {
  description = "cidr range used for public subnet"
  type        = string
  # default     = "172.69.1.0/24"
}

variable "pub_sub_tags" {
  description = "tags for public subnet"
  type        = string
  # default     = "public_subnet"
}

# ------------------------------

variable "priv_sub_cidr" {
  description = "cidr range used for private subnet"
  type        = string
  # default     = "172.69.2.0/24"
}

variable "priv_sub_tags" {
  description = "tags for private subnet"
  type        = string
  # default     = "private_subnet"
}

# ------------------------------

variable "wl_igw_tags" {
  description = "tags for internet gateway"
  type        = string
}

# ------------------------------

#--- Route Table Variables::-
variable "rt_pub_tag" {
  description = "public route table tag"
  type        = string
  # default     = "webserver_public_route_table"
}



# variable "rt_pub_asso_tag" {
#   description = "public route table association tag"
#   type        = string
#   # default     = "public_route_table_association"
# }

# ------------------------------

#--- Security Group Variables::-

variable "ajar_rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "private_rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

variable "sg_ajar_name" {
  description = "name for ajar security group"
  type        = string
  # default     = "ajar_sg"
}

variable "sg_priv_name" {
  description = "name for private security group"
  type        = string
  # default     = "private_sg"
}

variable "ajar_sg_tag" {
  description = "security group tag public"
  type        = string
  # default     = "sg_ajar_tag"
}

variable "priv_sg_tag" {
  description = "security group tag private"
  type        = string
  # default     = "sg_private_tag"
}