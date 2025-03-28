provider "aws" {
  region = "ap-northeast-1"
}

# Actions上ではlocalでstateを保持する。その後S3にアップロードして動的にフォルダ指定してstateを保持できるようにする
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
