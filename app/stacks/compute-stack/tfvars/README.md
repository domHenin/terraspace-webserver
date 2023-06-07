# Terraspace Webserver
`compute-stack .tfvars: README`

`./app/stacks/compute-stack/tfvars/README.md`

**WARNING**: Terraform Best Practices recommends **NEVER** publicly provide infrastructure's `.tfvars` files since in this could contain confidential infromation. 

Since this is just a **Personal Project** to help better understand the **Terraspace Framework** nothing of value would be in this `.tfvars` file. In this `ReadMe` will be the `variables` used for thie **Personal Project** since `.gitignore` will leave out this file due to Best Practices.

---

## Directory
```sh
app/stacks/compute-stack/tfvars/
├── README.md
├── base.tfvars
└── dev.tfvars
```

## Variables
```sh
#--------------------------------------------------#
# compute-stack: tfvars - base                     #
# ./app/stacks/compute-stack/tfvars/base.tfvars    #
#--------------------------------------------------#
#-- local vars
instance_type = "t2.micro"
apache_tag    = "apache_webserver_tag"
database_tag  = "database_tag"

#-- reference `./network-base`
public_subnet_id = <%= output('network-stack.sub_pub_id_output') %>
public_security_group_id = <%= output('network-stack.sg_ajar_id_output') %>

private_subnet_id = <%= output('network-stack.sub_priv_id_output') %>
private_security_group_id = <%= output('network-stack.sg_priv_id_output') %>
```