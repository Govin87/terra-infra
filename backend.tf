terraform {
  backend "s3"{
    bucket         = "s3terrafomaws"
    key            = "terraform.tfstate"
    region         = "us-west-2"
    encrypt        = true
  }
}

