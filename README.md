# Terraspace Webserver

This is a Terraspace project. It contains code to provision Cloud infrastructure built with [Terraform](https://www.terraform.io/) and the [Terraspace Framework](https://terraspace.cloud/).

---------------

## Getting Started

## Guides:
- [NAT Gateways](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-gateway.html)

-----

## Initialize
To initialize all the infrastructure stacks:

    AWS_PROFILE=<name-of-profile> terraspace all init
## Deploy

To deploy all the infrastructure stacks:

    AWS_PROFILE=<name-of-profile> terraspace all up

To deploy individual stacks:

    AWS_PROFILE=<name-of-profile> terraspace up demo # where demo is app/stacks/demo

## Terrafile

To use more modules, add them to the [Terrafile](https://terraspace.cloud/docs/terrafile/).

------

## Documentation

git push <>::
```sh
ERROR Message:-
Releasing state lock. This may take a few moments...
╷
│ Error: invalid value for name (cannot begin with sg-)
│
│   with module.security_group-base.aws_security_group.sg_ajar,
│   on ../../modules/security_group-base/main.tf line 11, in resource "aws_security_group" "sg_ajar":
│   11:   name = join("_", ["sg-ajar", var.vpc_id_mdl])
│
╵
╷
│ Error: invalid value for name (cannot begin with sg-)
│
│   with module.security_group-base.aws_security_group.sg_secure,
│   on ../../modules/security_group-base/main.tf line 37, in resource "aws_security_group" "sg_secure":
│   37:   name = join("_", ["sg-secur", var.vpc_id_mdl])
```