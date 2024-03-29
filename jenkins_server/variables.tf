variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.xlarge"
}

variable "key_name" {
  description = "Name of an existing EC2 KeyPair to enable SSH access to the instance"
  type        = string
  default     = "DevOps_key_Pair"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-0d9fab734b1a6143a"
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
  default     = "subnet-0b455b136100c5753"
}
