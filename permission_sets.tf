# Create Permission Sets
resource "aws_ssoadmin_permission_set" "data_scientist_access" {

  name             = "DataScientistAccess"
  description      = "Access for Data Scientists"
  instance_arn     = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "data_scientist_sagemaker" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
  permission_set_arn = aws_ssoadmin_permission_set.data_scientist_access.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "data_scientist_s3" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.data_scientist_access.arn
}

resource "aws_ssoadmin_permission_set" "ml_engineer_access" {

  name             = "MLEngineerAccess"
  description      = "Access for ML Engineers"
  instance_arn     = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "ml_engineer_sagemaker" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AmazonSageMakerFullAccess"
  permission_set_arn = aws_ssoadmin_permission_set.ml_engineer_access.arn
}

resource "aws_ssoadmin_permission_set" "devops_access" {

  name             = "DevOpsAccess"
  description      = "Access for DevOps Engineers"
  instance_arn     = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "devops_codebuild" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AWSCodeBuildAdminAccess"
  permission_set_arn = aws_ssoadmin_permission_set.devops_access.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "devops_codepipeline" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AWSCodePipeline_FullAccess"
  permission_set_arn = aws_ssoadmin_permission_set.devops_access.arn
}

resource "aws_ssoadmin_permission_set" "tester_access" {

  name             = "TesterAccess"
  description      = "Access for Testers"
  instance_arn     = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "tester_read_only" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.tester_access.arn
}

resource "aws_ssoadmin_permission_set" "production_support_access" {

  name             = "ProductionSupportAccess"
  description      = "Access for Production Support"
  instance_arn     = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_permission_set" "admin_access" {

  name             = "AdminAccess"
  description      = "Administrator Access"
  instance_arn     = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  session_duration = "PT8H"
}

resource "aws_ssoadmin_managed_policy_attachment" "admin_policy" {

  instance_arn       = tolist(data.aws_ssoadmin_instances.identity_center.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.admin_access.arn
}
