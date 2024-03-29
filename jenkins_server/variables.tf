variable "instance_type" {
  description = "EC2 instance type for the Jenkins server"
  default     = "t2.micro"
  # Optional: Allowed values for user input
  # allowed_values = [ "t2.micro", "t2.medium", ... ]
  # Optional: Type information (can be inferred by Terraform)
  # type = string
}

variable "key_name" {
  description = "Name of an existing EC2 KeyPair to enable SSH access to the instance"
  default     = "MyJenkinsKeyPair"
  type        = aws_ec2_key_pair.key_name

}

variable "vpc_id" {
  description = "VPC ID"
  default     = "vpc-1234567890abcdef0"
  type        = aws_ec2_vpc.id
}

variable "subnet_id" {
  description = "Subnet ID within the VPC"
  default     = "subnet-1234567890abcdef"
  type        = aws_ec2_subnet.id
}
