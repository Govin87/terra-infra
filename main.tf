terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "lambda" {
  source = "git::https://github.com/Govin87/terra-infra-mods.git//modules/lambda?ref=main"
}

module "api_gateway" {
  source            = "git::https://github.com/Govin87/terra-infra-mods.git//modules/api_gateway?ref=main"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
}

module "cloudfront" {
  source                = "git::https://github.com/Govin87/terra-infra-mods.git//modules/cloudfront?ref=main"
  s3_bucket_domain_name = module.s3.bucket_regional_domain_name
}

module "s3" {
  source = "git::https://github.com/Govin87/terra-infra-mods.git//modules/s3?ref=main"
}

module "dynamodb" {
  source = "git::https://github.com/Govin87/terra-infra-mods.git//modules/dynamodb?ref=main"
}

module "amazon_connect" {
  source = "git::https://github.com/Govin87/terra-infra-mods.git//modules/amazon_connect?ref=main"
}

module "xray" {
  source = "git::https://github.com/Govin87/terra-infra-mods.git//modules/observability/xray?ref=main"
}

module "cloudwatch" {
  source = "git::https://github.com/Govin87/terra-infra-mods.git//modules/observability/cloudwatch?ref=main"
}

