# Terraspace Webserver
`network-stack .tfvars: README`

`./app/stacks/network-stack/tfvars/README.md`

**WARNING**: Terraform Best Practices recommends **NEVER** publicly provide infrastructure's `.tfvars` files since in this could contain confidential infromation. 

Since this is just a **Personal Project** to help better understand the **Terraspace Framework** nothing of value would be in this `.tfvars` file. In this `ReadMe` will be the `variables` used for thie **Personal Project** since `.gitignore` will leave out this file due to Best Practices.

---

## Directory
```sh
app/stacks/network-stack/tfvars/
├── README.md
├── base.tfvars
└── dev.tfvars
```

## Variables
```sh
#--------------------------------------------------#
# network-stack: tfvars - base                     #
# ./app/stacks/network-stack/tfvars/base.tfvars    #
#--------------------------------------------------#

# -- vpc 
vpc_cidr = "172.69.0.0/16"
vpc_tags = "vpc_ws"

#-- public subnet
pub_sub_cidr = "172.69.1.0/24"
pub_sub_tags = "public_subnet"

#-- private subnet
priv_sub_cidr = "172.69.2.0/24"
priv_sub_tags = "private_subnet"

#-- internet gateway 
wl_igw_tags = "internet-gateway-ws"

#-- route table:- public
rt_pub_tag     = "webserver_public_route_table"

#-- security group:- public
sg_ajar_name = "ajar_sg"
ajar_sg_tag  = "sg_ajar_tag"

#-- security group:- private
sg_priv_name = "private_sg"
priv_sg_tag  = "sg_private_tag"
```