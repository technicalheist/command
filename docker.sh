#!/bin/bash

# Update package index
echo "Updating package index..."
sudo apt update

# Install prerequisites
echo "Installing prerequisites..."
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up Docker repository
echo "Setting up Docker repository..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again
echo "Updating package index again..."
sudo apt update

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Enable Docker service to start on boot
echo "Enabling Docker service to start on boot..."
sudo systemctl enable docker

# Verify Docker installation
echo "Verifying Docker installation..."
sudo docker --version

# Run a test Docker container
echo "Running a test Docker container..."
sudo docker run -it --rm hello-world
