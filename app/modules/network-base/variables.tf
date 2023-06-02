#----------------------------------------------#
# network-base: variables                      #
# ./app/modules/network-base/variables.tf      #
#----------------------------------------------#


variable "vpc_cidr" {
  description = "cidr range used for VPC"
  type        = string
}

variable "vpc_tags" {
  description = "tags for VPC"
  type        = string
}

# ------------------------------


variable "pub_sub_cidr" {
  description = "cidr range used for public subnet"
  type        = string
}

variable "pub_sub_tags" {
  description = "tags for public subnet"
  type        = string
}

# ------------------------------

variable "priv_sub_cidr" {
  description = "cidr range used for private subnet"
  type        = string
}

variable "priv_sub_tags" {
  description = "tags for private subnet"
  type        = string
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
}



variable "rt_pub_asso_tag" {
  description = "public route table association tag"
  type        = string
}

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
}

variable "sg_priv_name" {
  description = "name for private security group"
  type        = string
}

variable "ajar_sg_tag" {
  description = "security group tag public"
  type        = string
}

variable "priv_sg_tag" {
  description = "security group tag private"
  type        = string
}