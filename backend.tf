terraform {
  backend "s3"{
    bucket         = "govtest-cleo-test"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}

