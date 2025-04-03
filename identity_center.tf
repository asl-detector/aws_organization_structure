# Set up AWS IAM Identity Center (SSO)
resource "aws_identitystore_group" "data_scientists" {
  provider      = aws.management
  display_name  = "DataScientists"
  description   = "Group for Data Scientists"
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
}

resource "aws_identitystore_group" "ml_engineers" {
  provider      = aws.management
  display_name  = "MLEngineers"
  description   = "Group for ML Engineers"
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
}

resource "aws_identitystore_group" "devops_engineers" {
  provider      = aws.management
  display_name  = "DevOpsEngineers"
  description   = "Group for DevOps Engineers"
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
}

resource "aws_identitystore_group" "testers" {
  provider      = aws.management
  display_name  = "Testers"
  description   = "Group for Testers"
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
}

resource "aws_identitystore_group" "production_support" {
  provider      = aws.management
  display_name  = "ProductionSupport"
  description   = "Group for Production Support"
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
}

resource "aws_identitystore_group" "mlops_admins" {
  provider      = aws.management
  display_name  = "MLOpsAdmins"
  description   = "Group for MLOps Administrators"
  identity_store_id = tolist(data.aws_ssoadmin_instances.identity_center.identity_store_ids)[0]
}

# Get the IAM Identity Center instance ARN
data "aws_ssoadmin_instances" "identity_center" {
  provider = aws.management
}
