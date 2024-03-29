provider "aws" {
  region = var.region
}

module "jenkins_server" { # use the module block to reference the jenkins server
  source        = "./modules/jenkins_server" #./means the current directory where my main configuration file resides
  vpc_id        = var.vpc_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
}
