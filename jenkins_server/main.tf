provider "aws" {
  region = "us-east-1" # Change to your desired region
}

module "jenkins_server" {
  source            = "./modules/jenkins_server"
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = var.subnet_id
  vpc_id            = var.vpc_id
  iam_profile_name  = "Terraform-jenkins-role" # Provide the IAM instance profile
}
