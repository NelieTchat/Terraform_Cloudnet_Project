
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "aws_availability_zone" {
  description = "Availability zones for VPC"
  type        = string
  default     = "us-east-1"
} 

variable "terra_pub_sub1_Cidr" {
  description = "Public subnets for VPC"
  type        = string
  default     = "10.0.0.0/24"
}
variable "terra_pub_az" {
  description = "Availability zones for VPC"
  type        = string
  default     = "us-east-1a"
} 

variable "terra_priv_sub1_Cidr" {
  description = "Public subnets for VPC"
  type        = string
  default     = "10.0.1.0/24"
}
variable "terra_priv_az" {
  description = "Availability zones for VPC"
  type        = string
  default     = "us-east-1b"
} 

variable "instance_type" {
  type        = string
  description = "The type of the instance"
  /* default     = "t2.micro" */
}
variable "instance_key_pair" {
  type        = string
  description = "netchatc-key-pair"
  default     = null
}
variable "aws_region" {
  description = "creating a variable to hold the region name value"
  type        = string
  default     = "us-east-1"
 }
