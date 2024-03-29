variable "subnet_id" {
  description = "Subnet ID within the VPC"
  # default     = "subnet-0b455b136100c5753"
}

variable "vpc_id" {
  description = "VPC ID"
  # default     = "vpc-0d9fab734b1a6143a"
}

variable "instance_type" {
  description = "EC2 instance type for the Jenkins server"
  # default     = "t2.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 KeyPair to enable SSH access to the instance"
  # default     = "DevOps_key_Pair"
}


