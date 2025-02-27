provider "aws" {
  region = "us-west-2"
}
module "s3" {
  source = "./modules/s3"
}

module "api_gateway" {
  source  = "./modules/api_gateway"
  lambda_invoke_arn = module.lambda.lambda_invoke_arn
}

module "amazon_connect" {
  source         = "./modules/amazon_connect"
  instance_alias = "my-connect-instance"
}


module "lambda" {
  source = "./modules/lambda"
}

module "dynamodb1" {
  source = "./modules/dynamodb"
  table_name = "Table1"
}

module "dynamodb2" {
  source = "./modules/dynamodb"
  table_name = "Table2"
}

module "observability" {
  source = "./modules/observability"
}


module "cloudfront" {
  source = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3.bucket_regional_domain_name
}
