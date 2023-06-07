# Terraspace Webserver

This is a Terraspace project. It contains code to provision Cloud infrastructure built with [Terraform](https://www.terraform.io/) and the [Terraspace Framework](https://terraspace.cloud/).

---------------

## Getting Started

The idea of this project is to build a Webserver using Terraform Infrastructure.

## Guides:
- [Terraspace Framework](https://terraspace.cloud/docs/learn/aws/)
- [Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [NAT Gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)
- [Invoking a StartupScript](https://fabianlee.org/2021/05/28/terraform-invoking-a-startup-script-for-an-ec2-aws_instance/)

-----

## Learning Path: 
- To utilize the `Child Module Variable` in the ***stack***, assign it the value of the corresponding ***Variable*** at the same directory level. The ***Variable*** closely resembles the `Child Module Variable`. Since the `.tfvars` file is located in the ***stack***, Terraspace automatically uses this file for the variables.
- **Dependencies**: To configure dependencies, you simply wire stack outputs to inputs variables of another stack. Here is an example: (the instance needs the `subnet_id` so using this syntax and pointing to the **stack** and **output**)
```sh
public_subnet_id = <%= output('network-stack.sub_pub_id_output') %>
```

- error when specifing `apache_install.sh` as path in `compute-base`:
```sh
In this configuration, ${path.module} represents the directory path of the current module (in this case, the compute-base directory). By appending /files/apache_install.sh, it constructs the correct file path to the apache_install.sh script relative to the compute-base directory.
```

- error when using `.tfvars` file (above error brought me here):
```sh
In Terraspace, you can place your .tfvars file in the Terraspace project's config directory. By default, Terraspace looks for .tfvars files in this directory and automatically loads them during deployment.
```

----

## Initialize
To initialize all the infrastructure stacks:

    AWS_PROFILE=<name-of-profile> terraspace all init


## AWS Connect Test
To test the AWS Connection:

    AWS_PROFILE=<name-of-profile> aws sts get-caller-identity

## Deploy

To deploy all the infrastructure stacks:

    AWS_PROFILE=<name-of-profile> terraspace all up

To deploy individual stacks:

    AWS_PROFILE=<name-of-profile> terraspace up demo # where demo is app/stacks/demo

## Terrafile

To use more modules, add them to the [Terrafile](https://terraspace.cloud/docs/terrafile/).

------

## Module Structure
```sh
terraspace-webserver/
├── Gemfile
├── Gemfile.lock
├── README.md
├── Terrafile
├── app
│   ├── modules
│   │   ├── compute-base
│   │   │   ├── README.md
│   │   │   ├── files
│   │   │   │   ├── apache_install.sh
│   │   │   │   └── mysql_install.sh
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── network-base
│   │       ├── README.md
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   └── stacks
│       ├── compute-stack
│       │   ├── README.md
│       │   ├── main.tf
│       │   ├── outputs.tf
│       │   ├── tfvars
│       │   │   ├── base.tfvars
│       │   │   └── dev.tfvars
│       │   └── variables.tf
│       └── network-stack
│           ├── README.md
│           ├── main.tf
│           ├── outputs.tf
│           ├── tfvars
│           │   ├── base.tfvars
│           │   └── dev.tfvars
│           └── variables.tf
├── config
│   ├── app.rb
│   └── terraform
│       ├── backend.tf
│       └── provider.tf
└── log
```

-------

# Documentation

- Current Behavior 002: this issue was from me creating an Internet Gateway attachement. [See Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) and read **Argument Reference** that state the *aws_internet_gateway_attachment resource for an alternate way to attach an Internet Gateway to a VPC.*

## Expected Behavior
- Expected Behavior 001:: `Plan: 9 to add, 0 to change, 0 to destroy.`
- Expected Behavior 002:: `terraspace plan compute-stack:  Plan: 9 to add, 0 to change, 0 to destroy.
terraspace plan network-stack:  Plan: 2 to add, 0 to change, 0 to destroy.`
- Expected Behavior 003:: `terraspace up network-stack -- Plan: 7 to add, 0 to change, 0 to destroy.`
- ∆**Expected Behavior 004**∇: `Plan: 8 to add, 0 to change, 0 to destroy.`
- ∆**Expected Behaviour 005**∇: `terraspace plan compute-stack:  Plan: 10 to add, 0 to change, 0 to destroy.
terraspace plan network-stack:  Plan: 8 to add, 0 to change, 0 to destroy.`



------------

## Current Behavior
- Current Behavior 001:: 
```sh
│ Error: creating route: one of `carrier_gateway_id, core_network_arn, egress_only_gateway_id, gateway_id, instance_id, local_gateway_id, nat_gateway_id, network_interface_id, transit_gateway_id, vpc_endpoint_id, vpc_peering_connection_id` must be specified
│
│   with module.route_table-base.aws_route_table.rt_pub_rsrc,
│   on ../../modules/route_table-base/main.tf line 7, in resource "aws_route_table" "rt_pub_rsrc":
│    7: resource "aws_route_table" "rt_pub_rsrc" {
│
╵
╷
│ Error: creating route: one of `carrier_gateway_id, core_network_arn, egress_only_gateway_id, gateway_id, instance_id, local_gateway_id, nat_gateway_id, network_interface_id, transit_gateway_id, vpc_endpoint_id, vpc_peering_connection_id` must be specified
│
│   with module.route_table-base.aws_route_table.private_rt,
│   on ../../modules/route_table-base/main.tf line 30, in resource "aws_route_table" "private_rt":
│   30: resource "aws_route_table" "private_rt" {
│
╵
╷
│ Error: creating Security Group (sg_vpc-0d8b383622d259fcf): InvalidGroup.Duplicate: The security group 'sg_vpc-0d8b383622d259fcf' already exists for VPC 'vpc-0d8b383622d259fcf'
│       status code: 400, request id: 0e9d3291-ff2e-4b14-93e9-a6794d91950d
│
│   with module.security_group-base.aws_security_group.sg_ajar,
│   on ../../modules/security_group-base/main.tf line 8, in resource "aws_security_group" "sg_ajar":
│    8: resource "aws_security_group" "sg_ajar" {
```

- Current Behavior 002::
 ````sh
terraspace up compute-stack:  │ Error: creating EC2 Internet Gateway Attachment: error attaching EC2 Internet Gateway to VPC: Resource.AlreadyAssociated: resource is already attached to network
terraspace up network-stack:  │ Error: creating EC2 Internet Gateway Attachment: error attaching EC2 Internet Gateway to VPC: Resource.AlreadyAssociated: resource is already attached to network 
terraspace up network-stack:  │ Error: creating Route Table Association: Resource.AlreadyAssociated: the specified association for route table conflicts with an existing association
Error running: terraspace up compute-stack. Fix the error above or check logs for the error.
Error running: terraspace up network-stack. Fix the error above or check logs for the error.
````

- Current Behavior 003:: 
 ```sh
╷
│ Error: creating Route in Route Table (rtb-020fb50db062b2251) with destination (0.0.0.0/0): InvalidParameterValue: route table rtb-020fb50db062b2251 and network gateway igw-0a87b0d01921b5497 belong to different networks
│       status code: 400, request id: 5dc5b440-a736-4bf8-9da0-9cc29cecd34f
│
│   with module.network-base.aws_route_table.rt_pub_rsrc,
│   on ../../modules/network-base/main.tf line 58, in resource "aws_route_table" "rt_pub_rsrc":
│   58: resource "aws_route_table" "rt_pub_rsrc" {
```
- ∆**Current Behavior 004**∇:: 
```sh
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.
```
- - ∆**Current Behavior 005**∇:: 
```sh
Apply complete! Resources: 18 added, 0 changed, 0 destroyed.
```

-------------------


### Notes:

- after each acg enviroment del .tfstate file from compute-stack and network-stack