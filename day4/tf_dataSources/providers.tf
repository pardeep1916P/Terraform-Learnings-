provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "iam"
  region = var.region
}