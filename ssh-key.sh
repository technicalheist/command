#!/bin/bash

# Prompt user for email ID
read -p "Enter your email ID: " email

# Generate SSH key with provided email
ssh-keygen -t rsa -b 4096 -C "$email"

echo "SSH key generated successfully!"
