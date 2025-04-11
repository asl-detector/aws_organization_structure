# Assign Groups to Accounts with appropriate Permission Sets

# Data Account Assignments
resource "aws_ssoadmin_account_assignment" "data_scientists_data_account" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.data_scientist_access.arn

  principal_id   = aws_identitystore_group.data_scientists.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.data.id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "ml_engineers_data_account" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.ml_engineer_access.arn

  principal_id   = aws_identitystore_group.ml_engineers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.data.id
  target_type = "AWS_ACCOUNT"
}

# Development Account Assignments
resource "aws_ssoadmin_account_assignment" "data_scientists_dev_account" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.data_scientist_access.arn

  principal_id   = aws_identitystore_group.data_scientists.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.development.id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "ml_engineers_dev_account" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.ml_engineer_access.arn

  principal_id   = aws_identitystore_group.ml_engineers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.development.id
  target_type = "AWS_ACCOUNT"
}

# Artifact Account Assignments
resource "aws_ssoadmin_account_assignment" "ml_engineers_artifact_account" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.ml_engineer_access.arn

  principal_id   = aws_identitystore_group.ml_engineers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.artifact.id
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "devops_engineers_artifact_account" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.devops_access.arn

  principal_id   = aws_identitystore_group.devops_engineers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.artifact.id
  target_type = "AWS_ACCOUNT"
}

# CI/CD Account Assignments
resource "aws_ssoadmin_account_assignment" "devops_engineers_cicd_account" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.devops_access.arn

  principal_id   = aws_identitystore_group.devops_engineers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.cicd.id
  target_type = "AWS_ACCOUNT"
}

# Staging Account Assignments
resource "aws_ssoadmin_account_assignment" "testers_staging_account" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.tester_access.arn

  principal_id   = aws_identitystore_group.testers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.staging.id
  target_type = "AWS_ACCOUNT"
}

# Production Account Assignments
resource "aws_ssoadmin_account_assignment" "production_support_prod_account" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.production_support_access.arn

  principal_id   = aws_identitystore_group.production_support.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.production.id
  target_type = "AWS_ACCOUNT"
}

# Operations Account Assignments
resource "aws_ssoadmin_account_assignment" "ml_engineers_ops_account" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.ml_engineer_access.arn

  principal_id   = aws_identitystore_group.ml_engineers.group_id
  principal_type = "GROUP"

  target_id   = aws_organizations_account.operations.id
  target_type = "AWS_ACCOUNT"
}

# Admin Access for all accounts
resource "aws_ssoadmin_account_assignment" "admin_access_all_accounts" {
  for_each = {
    data        = aws_organizations_account.data.id
    development = aws_organizations_account.development.id
    artifact    = aws_organizations_account.artifact.id
    cicd        = aws_organizations_account.cicd.id
    staging     = aws_organizations_account.staging.id
    production  = aws_organizations_account.production.id
    operations  = aws_organizations_account.operations.id
  }


  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.admin_access.arn

  principal_id   = aws_identitystore_group.mlops_admins.group_id
  principal_type = "GROUP"

  target_id   = each.value
  target_type = "AWS_ACCOUNT"
}
