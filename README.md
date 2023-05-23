# Terraspace Webserver

This is a Terraspace project. It contains code to provision Cloud infrastructure built with [Terraform](https://www.terraform.io/) and the [Terraspace Framework](https://terraspace.cloud/).

---------------

## Getting Started

The idea of this project is to build a Webserver using Terraform Infrastructure.

## Guides:
- [Terraspace Framework](https://terraspace.cloud/docs/learn/aws/)
- [Terraform Registry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [NAT Gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

-----

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
├─ config/
│  ├─ terraform/
│  │  ├─ backend.tf
│  │  ├─ provider.tf
├─ app/
│  ├─ modules/
│  ├─ stacks/
├─ .gitignore
├─ Gemfile
├─ Terrafile
├─ README.md
````


-------

# Documentation

## Expected Behaviour
- EB 001:: `Plan: 9 to add, 0 to change, 0 to destroy.`

------------

## Current Behavior
- EB 001:: 
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