 #!/bin/bash

      # Update package lists
      sudo apt update

      # Install fontconfig (recommended for GUI elements)
      sudo apt install fontconfig -y

      # Add the Jenkins repository (verify the version for your needs):
      sudo wget -O /etc/apt/sources.list.d/jenkins.list https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key  # Replace version if needed
      sudo echo deb [signed-by=/etc/apt/sources.list.d/jenkins.list] https://pkg.jenkins.io/debian-stable binary | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

      # Update package lists again
      sudo apt-get update

      # Install OpenJDK (verify the version for your needs):
      sudo apt install openjdk-17-jre-headless -y  # Replace version if needed

      # Install Jenkins
      sudo apt install jenkins -y

      # Enable and start Jenkins service
      sudo systemctl enable jenkins
      sudo systemctl start jenkins

      # Install Python3 and pip3 (if not already installed)
      sudo apt install python3-pip -y  # Check if already installed with `python3 --version`

      # Install AWS CLI
      sudo pip3 install awscli

      # Set ownership of Jenkins home directory (optional, adjust as needed)
      sudo chown -R jenkins:jenkins /var/lib/jenkins

      # (Optional) Add Jenkins user to a group for specific permissions

      # Restart Jenkins service after ownership changes (if applicable)
      # sudo systemctl restart jenkins