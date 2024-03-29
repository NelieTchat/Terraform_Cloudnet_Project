# Define resources for the Jenkins server
resource "aws_security_group" "jenkins_sg" {
  name = "jenkins-security-group"
  description = "Enable SSH and HTTP access"

  ingress {
    from_port = 22
    to_port   = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Update with your allowed IP ranges
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Update with your allowed IP ranges
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
vpc_id        = var.vpc_id
 
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-07d9b9ddc6cd8dd30"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]
  iam_instance_profile = "Terraform-jenkins-role" # Provide the IAM instance profile
}

