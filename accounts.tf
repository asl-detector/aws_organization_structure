# Create Individual Accounts
resource "aws_organizations_account" "data" {
  provider = aws.management
  name     = "Data"
  email    = "asl.dataset+data@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.development.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Development"
    Purpose     = "Data Storage and Processing"
  }
}

resource "aws_organizations_account" "development" {
  provider = aws.management
  name     = "Development"
  email    = "asl.dataset+dev@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.development.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Development"
    Purpose     = "ML Model Development"
  }
}

resource "aws_organizations_account" "artifact" {
  provider = aws.management
  name     = "Artifact"
  email    = "asl.dataset+artifact@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.operations.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Operations"
    Purpose     = "Model Artifact Storage"
  }
}

resource "aws_organizations_account" "cicd" {
  provider = aws.management
  name     = "CI/CD"
  email    = "asl.dataset+cicd@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.operations.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Operations"
    Purpose     = "Model CI/CD Pipeline"
  }
}

resource "aws_organizations_account" "staging" {
  provider = aws.management
  name     = "Staging"
  email    = "asl.dataset+stg@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.production.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Production"
    Purpose     = "Model Staging Environment"
  }
}

resource "aws_organizations_account" "production" {
  provider = aws.management
  name     = "Production"
  email    = "asl.dataset+prd@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.production.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Production"
    Purpose     = "Model Production Environment"
  }
}

resource "aws_organizations_account" "operations" {
  provider = aws.management
  name     = "Operations"
  email    = "asl.dataset+operations@gmail.com"  # Use your organization's email pattern
  parent_id = aws_organizations_organizational_unit.operations.id
  
  role_name = "OrganizationAccountAccessRole"
  tags = {
    Environment = "Operations"
    Purpose     = "Model Monitoring and Operations"
  }
}
