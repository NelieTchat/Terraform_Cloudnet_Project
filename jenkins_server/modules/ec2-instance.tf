# jenkins_server
resource "aws_security_group" "jenkins_sg" {
  name   = "jenkins_security_group"
  description = "Enable SSH and HTTP access"

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your authorized IP ranges
  }

  ingress {
    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your authorized IP ranges
  }

  vpc_id = var.vpc_id
}

resource "aws_instance" "jenkins_server" {
  create = true
  ami    = "ami-07d9b9ddc6cd8dd30"
  instance_type = var.instance_type
  key_name       = var.key_name
  subnet_id      = var.subnet_id
  vpc_security_group_ids = [aws_security_group.jenkins_sg.id]

  # Reference the IAM instance profile name (assuming it's already created)
  iam_instance_profile = var.jenkins_iam_profile

  user_data = <<EOF
        #!/bin/bash
        apt update
        apt install fontconfig openjdk-17-jre -y
        wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
        echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
        apt-get update
        apt-get install jenkins -y
        # Optimized AWS CLI installation
        apt install -y unzip python3-pip
        pip3 install awscli
        sudo aws configure
        EOF
        }