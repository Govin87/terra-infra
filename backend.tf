terraform {
  backend "s3"{
    bucket         = "govtest-cleo-test1"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}

