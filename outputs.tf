output "account_ids" {
  description = "IDs of all accounts"
  value = {
    data        = aws_organizations_account.data.id
    development = aws_organizations_account.development.id
    artifact    = aws_organizations_account.artifact.id
    cicd        = aws_organizations_account.cicd.id
    staging     = aws_organizations_account.staging.id
    production  = aws_organizations_account.production.id
    operations  = aws_organizations_account.operations.id
  }
}

output "identity_center_instance_arn" {
  description = "ARN of the IAM Identity Center instance"
  value       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
}

output "group_ids" {
  description = "IDs of all groups"
  value = {
    data_scientists    = aws_identitystore_group.data_scientists.group_id
    ml_engineers       = aws_identitystore_group.ml_engineers.group_id
    devops_engineers   = aws_identitystore_group.devops_engineers.group_id
    testers            = aws_identitystore_group.testers.group_id
    production_support = aws_identitystore_group.production_support.group_id
    mlops_admins       = aws_identitystore_group.mlops_admins.group_id
  }
}

