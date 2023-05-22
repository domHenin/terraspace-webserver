#--------------------------------------------------#
# security_group-base: main                        #
# ./app/modules/security_group-base/main.tf        #
#--------------------------------------------------#


#-- Resource: AWS Security Group Open
resource "aws_security_group" "sg_ajar" {
  vpc_id = var.vpc_id_mdl
  #   name   = join("_", ["sg", aws_vpc.vpc_wonder_lab.id])
  name = join("_", ["sg", var.vpc_id_mdl])
  dynamic "ingress" {
    for_each = var.ajar_rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.ajar_sg_tag
  }
}


resource "aws_security_group" "sg_secure" {
  vpc_id = var.vpc_id_mdl
  #   name   = join("_", ["sg", aws_vpc.vpc_wonder_lab.id])
  name = join("_", ["sg", var.vpc_id_mdl])
  dynamic "ingress" {
    for_each = var.private_rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = var.ajar_sg_tag
  }
}


#---- graveyard
# resource "aws_security_group" "sg_secure_connection" {
# #   name        = var.private_sg_name
# #   description = var.private_sg_description
#   vpc_id      = var.vpc_id_mdl

#   ingress {
#     description      = "Allow traffic on port 22 from everywhere"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = var.private_sg_tag
#   }
# }