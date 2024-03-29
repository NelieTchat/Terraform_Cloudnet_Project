# Configure required providers
provider "aws" {
  region = "us-east-1" # Update with your desired region
}

# Call the Jenkins server module
module "jenkins_server" {
  source = "./modules/jenkins_server"
  vpc_id = "vpc-0d9fab734b1a6143a" 
  # instance_type = "t2.micro"  # Example valu
  # key_name      = "DevOps_key_Pair"  # Example value
  # subnet_id     = "subnet-0b455b136100c5753"

}