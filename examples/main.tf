# Create a local state backend
terraform {
  backend "local" {
    path = ".terraform/terraform.tfstate"
  }
}


# Create a bucket
module "my_bucket" {
  source            = "../"
  bucket            = "test-user"
  acl               = "private"
  enable_versioning = true
  common_tags  = {
    "created_by"   =  "terraform"
    "project_id"   =  "p000123"
    "project_name" =  "test"
    "environment"  =  "dev"
    "component"    =  "bucket"

  }

}


