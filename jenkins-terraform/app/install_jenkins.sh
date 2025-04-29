#!/bin/bash

# Update system
sudo apt update && sudo apt upgrade -y

# Install Java (Jenkins dependency)
sudo apt install -y openjdk-11-jdk

# Add Jenkins repository and install Jenkins
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list
sudo apt update
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins
scp install_jenkins.sh azureuser@52.228.34.77:/home/azureuser/
ssh azureuser@52.228.34.77 "chmod +x /home/azureuser/install_jenkins.sh && sudo /home/azureuser/install_jenkins.sh"
