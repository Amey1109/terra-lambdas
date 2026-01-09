terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.28.0"
    }
  }
  backend "s3" {
    bucket       = "terra-s3-remote-backed-bucket"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}
