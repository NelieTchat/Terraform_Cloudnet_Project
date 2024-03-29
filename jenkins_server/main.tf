provider "aws" {
  region = "us-east-1" # Change to your desired region
}

module "jenkins_server" {
  source = "./modules/jenkins_server"

  # Pass variables to the Jenkins server module
  instance_type        = var.instance_type
  key_name             = var.key_name
  vpc_id               = var.vpc_id
  subnet_id            = var.subnet_id
  jenkins_iam_profile  = var.jenkins_iam_profile
}