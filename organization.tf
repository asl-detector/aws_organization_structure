# Create AWS Organization
# resource "aws_organizations_organization" "asl_data_org" {
#   provider = aws.management
  
#   feature_set                   = "ALL"
#   aws_service_access_principals = [
#     "cloudtrail.amazonaws.com",
#     "sagemaker.amazonaws.com",
#     "config.amazonaws.com",
#     "ssm.amazonaws.com",
#     "sso.amazonaws.com"
#   ]
  
#   enabled_policy_types = [
#     "SERVICE_CONTROL_POLICY",
#     "TAG_POLICY"
#   ]
# }

# data "aws_organizations_organization" "asl_data_org" {
#   provider = aws.management
# #   id = "o-en6164sihz"
# }

# Create Organizational Units
resource "aws_organizations_organizational_unit" "asl_data" {
  provider  = aws.management
  name      = "MLOps"
  parent_id = "r-zefi"
    # parent_id = data.aws_organizations_organization.asl_data_org.roots[0].id
}

resource "aws_organizations_organizational_unit" "development" {
  provider  = aws.management
  name      = "Development"
  parent_id = aws_organizations_organizational_unit.asl_data.id
}

resource "aws_organizations_organizational_unit" "production" {
  provider  = aws.management
  name      = "Production"
  parent_id = aws_organizations_organizational_unit.asl_data.id
}

resource "aws_organizations_organizational_unit" "operations" {
  provider  = aws.management
  name      = "Operations"
  parent_id = aws_organizations_organizational_unit.asl_data.id
}
