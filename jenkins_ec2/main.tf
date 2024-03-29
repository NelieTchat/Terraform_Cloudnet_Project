provider "aws" {
  region = var.region
}

module "jenkins_server" {
  source        = "./modules/jenkins_server"
  vpc_id        = var.vpc_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
}
