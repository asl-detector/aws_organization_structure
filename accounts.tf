# Create Individual Accounts
resource "aws_organizations_account" "data" {

  name      = "Data"
  email     = "asl.dataset+data@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.development.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Development"
    Purpose     = "Data Storage and Processing"
  }
}

resource "aws_organizations_account" "development" {

  name      = "Development"
  email     = "asl.dataset+dev@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.development.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Development"
    Purpose     = "ML Model Development"
  }
}

resource "aws_organizations_account" "artifact" {

  name      = "Artifact"
  email     = "asl.dataset+artifact@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.operations.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Operations"
    Purpose     = "Model Artifact Storage"
  }
}

resource "aws_organizations_account" "cicd" {

  name      = "CI/CD"
  email     = "asl.dataset+cicd@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.operations.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Operations"
    Purpose     = "Model CI/CD Pipeline"
  }
}

resource "aws_organizations_account" "staging" {

  name      = "Staging"
  email     = "asl.dataset+stg@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.production.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Production"
    Purpose     = "Model Staging Environment"
  }
}

resource "aws_organizations_account" "production" {

  name      = "Production"
  email     = "asl.dataset+prd@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.production.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Production"
    Purpose     = "Model Production Environment"
  }
}

resource "aws_organizations_account" "operations" {

  name      = "Operations"
  email     = "asl.dataset+operations@gmail.com" # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.operations.id

  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Operations"
    Purpose     = "Model Monitoring and Operations"
  }
}
