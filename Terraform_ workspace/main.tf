provider "aws" {
  region = var.region
}

locals {
  instance_name = "${terraform.workspace} - instance"
}
resource "aws_instance" "linux_instance" {
  ami                    = data.aws_ami.Linux_ami.id
  instance_type          = var.instance_type
  key_name               = var.instance_key_pair
  
  tags = {
    Name = local.instance_name
}
}
/* variable "instance_type" {
  type        = string
  description = "The type of the instance"
  default     = "t2.micro"
}
variable "instance_key_pair" {
  type        = string
  description = "netchatc-key-pair"
  default     = null
} */