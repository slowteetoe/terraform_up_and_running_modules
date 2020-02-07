# Application Load Balancer (ALB)

This module creates an load-balancer (ELB) instance in AWS

## Quick Start

Terraform modules are not intended to be deployed directly, instead they should be used in other Terraform configurations.

## Testing

There are tests found in `/test` using Terratest, a Go library.  

Tests create actual resources, in the actual AWS account.

IMPORTANT: in practice, automated tests should only be run against a separate AWS account!  Something like `cloud-nuke` or `aws-nuke` should be used to periodically make sure there are no resources left over, again, in that separate AWS account solely reserved for automated testing, NOT a real environment.