# AWS Organization Structure

This module manages the foundational AWS organization structure for the ASL Dataset project, including:

- AWS Organizations setup
- AWS Identity Center (SSO) configuration
- Account structure and hierarchies
- Permission sets and access controls

## Components

- `accounts.tf` - AWS account definitions and organization structure
- `identity_center.tf` - AWS SSO/Identity Center configuration
- `organization.tf` - AWS Organizations setup and policies
- `permission_sets.tf` - Permission sets for different roles
- `account_assignments.tf` - Assignment of permission sets to accounts

## Usage

This module should be applied first when setting up the infrastructure, as other modules depend on the account structure and permissions defined here.

```bash
terraform init
terraform plan
terraform apply
```

## Outputs

The module exports account IDs, ARNs, and other references used by dependent modules to establish cross-account access and permissions.