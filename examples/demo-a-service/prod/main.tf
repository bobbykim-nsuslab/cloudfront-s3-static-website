terraform {

  backend "s3" {
    bucket         = "nsuslab-devops-terraform-state"
    key            = "nsus/frontend/demo-service/prod/terraform.tfstate"
    region         = "ap-northeast-2"
    encrypt        = false
    dynamodb_table = "nsuslab-devops-lock-table"
  }
}

provider "aws" {
  region = var.aws_region
}

provider "cloudflare" {
}

provider "random" {
}

modules static-website {
  source = "../../.."

  aws_region = var.aws_region
  site_domain = var.site_domain

}